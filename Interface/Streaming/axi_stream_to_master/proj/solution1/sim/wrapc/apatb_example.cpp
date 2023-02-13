#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem0 "../tv/cdatafile/c.example.autotvin_gmem0.dat"
#define AUTOTB_TVOUT_gmem0 "../tv/cdatafile/c.example.autotvout_gmem0.dat"
// wrapc file define:
#define AUTOTB_TVIN_inStreamTop_V_data_V "../tv/cdatafile/c.example.autotvin_inStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_data_V "../tv/cdatafile/c.example.autotvout_inStreamTop_V_data_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_keep_V "../tv/cdatafile/c.example.autotvin_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_keep_V "../tv/cdatafile/c.example.autotvout_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_strb_V "../tv/cdatafile/c.example.autotvin_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_strb_V "../tv/cdatafile/c.example.autotvout_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_last_V "../tv/cdatafile/c.example.autotvin_inStreamTop_V_last_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_last_V "../tv/cdatafile/c.example.autotvout_inStreamTop_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V "../tv/stream_size/stream_size_in_inStreamTop_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V "../tv/stream_size/stream_size_in_inStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V "../tv/stream_size/stream_size_in_inStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V "../tv/stream_size/stream_size_in_inStreamTop_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_outTop "../tv/cdatafile/c.example.autotvin_outTop.dat"
#define AUTOTB_TVOUT_outTop "../tv/cdatafile/c.example.autotvout_outTop.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem0 "../tv/rtldatafile/rtl.example.autotvout_gmem0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_inStreamTop_V_data_V "../tv/rtldatafile/rtl.example.autotvout_inStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_keep_V "../tv/rtldatafile/rtl.example.autotvout_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_strb_V "../tv/rtldatafile/rtl.example.autotvout_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_last_V "../tv/rtldatafile/rtl.example.autotvout_inStreamTop_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_outTop "../tv/rtldatafile/rtl.example.autotvout_outTop.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem0_depth = 0;
  inStreamTop_V_data_V_depth = 0;
  inStreamTop_V_keep_V_depth = 0;
  inStreamTop_V_strb_V_depth = 0;
  inStreamTop_V_last_V_depth = 0;
  outTop_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem0 " << gmem0_depth << "}\n";
  total_list << "{inStreamTop_V_data_V " << inStreamTop_V_data_V_depth << "}\n";
  total_list << "{inStreamTop_V_keep_V " << inStreamTop_V_keep_V_depth << "}\n";
  total_list << "{inStreamTop_V_strb_V " << inStreamTop_V_strb_V_depth << "}\n";
  total_list << "{inStreamTop_V_last_V " << inStreamTop_V_last_V_depth << "}\n";
  total_list << "{outTop " << outTop_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem0_depth;
    int inStreamTop_V_data_V_depth;
    int inStreamTop_V_keep_V_depth;
    int inStreamTop_V_strb_V_depth;
    int inStreamTop_V_last_V_depth;
    int outTop_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void example_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_example_hw(volatile void * __xlx_apatb_param_inStreamTop_V_data_V, volatile void * __xlx_apatb_param_inStreamTop_V_keep_V, volatile void * __xlx_apatb_param_inStreamTop_V_strb_V, volatile void * __xlx_apatb_param_inStreamTop_V_last_V, volatile void * __xlx_apatb_param_outTop) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem0);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > gmem0_pc_buffer(1024);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem0");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem0_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1024; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_outTop)[j*8+0] = gmem0_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+1] = gmem0_pc_buffer[i].range(15, 8).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+2] = gmem0_pc_buffer[i].range(23, 16).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+3] = gmem0_pc_buffer[i].range(31, 24).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+4] = gmem0_pc_buffer[i].range(39, 32).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+5] = gmem0_pc_buffer[i].range(47, 40).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+6] = gmem0_pc_buffer[i].range(55, 48).to_int64();
((char*)__xlx_apatb_param_outTop)[j*8+7] = gmem0_pc_buffer[i].range(63, 56).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_inStreamTop_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_inStreamTop_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_inStreamTop_stream_buf_final_size; ++i) {
((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->read();
}

    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem0
aesl_fh.touch(AUTOTB_TVIN_gmem0);
aesl_fh.touch(AUTOTB_TVOUT_gmem0);
//inStreamTop
aesl_fh.touch(AUTOTB_TVIN_inStreamTop_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_inStreamTop_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_inStreamTop_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_inStreamTop_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_inStreamTop_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_inStreamTop_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_inStreamTop_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_inStreamTop_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V);
//outTop
aesl_fh.touch(AUTOTB_TVIN_outTop);
aesl_fh.touch(AUTOTB_TVOUT_outTop);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_outTop = 0;
// print gmem0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_outTop = 0*8;
  if (__xlx_apatb_param_outTop) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_outTop)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem0, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.gmem0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem0, __xlx_sprintf_buffer.data());
}
// data
std::vector<long long> __xlx_apatb_param_inStreamTop_V_data_V_stream_buf;
{
  while (!((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->empty())
    __xlx_apatb_param_inStreamTop_V_data_V_stream_buf.push_back(((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->write(__xlx_apatb_param_inStreamTop_V_data_V_stream_buf[i]);
  }
long __xlx_apatb_param_inStreamTop_stream_buf_size = ((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->size();
// keep
std::vector<char> __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->empty())
    __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->write(__xlx_apatb_param_inStreamTop_V_keep_V_stream_buf[i]);
  }
// strb
std::vector<char> __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->empty())
    __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->write(__xlx_apatb_param_inStreamTop_V_strb_V_stream_buf[i]);
  }
// user
// last
std::vector<char> __xlx_apatb_param_inStreamTop_V_last_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->empty())
    __xlx_apatb_param_inStreamTop_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->write(__xlx_apatb_param_inStreamTop_V_last_V_stream_buf[i]);
  }
// id
// dest
// print outTop Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_outTop, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_outTop;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_outTop, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.outTop_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_outTop, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
example_hw_stub_wrapper(__xlx_apatb_param_inStreamTop_V_data_V, __xlx_apatb_param_inStreamTop_V_keep_V, __xlx_apatb_param_inStreamTop_V_strb_V, __xlx_apatb_param_inStreamTop_V_last_V, __xlx_apatb_param_outTop);
CodeState = DUMP_OUTPUTS;
// print gmem0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_outTop = 0*8;
  if (__xlx_apatb_param_outTop) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_outTop)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_gmem0, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.gmem0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem0, __xlx_sprintf_buffer.data());
}
long __xlx_apatb_param_inStreamTop_stream_buf_final_size = __xlx_apatb_param_inStreamTop_stream_buf_size - ((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; ++j) {
sc_bv<64> __xlx_tmp_0_lv = ((long long*)&__xlx_apatb_param_inStreamTop_V_data_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = ((char*)&__xlx_apatb_param_inStreamTop_V_keep_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = ((char*)&__xlx_apatb_param_inStreamTop_V_strb_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_4_lv = ((char*)&__xlx_apatb_param_inStreamTop_V_last_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());

// dump stream ingress status to file

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_data_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_keep_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_strb_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_last_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
