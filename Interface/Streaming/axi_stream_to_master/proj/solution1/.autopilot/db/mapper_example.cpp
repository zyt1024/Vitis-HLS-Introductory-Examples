#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_inStreamTop_V_data_V_V_cap_bc;
static AESL_RUNTIME_BC __xlx_inStreamTop_V_data_V_V_size_Reader("../tv/stream_size/stream_size_in_inStreamTop_V_data_V.dat");
unsigned int ap_apatb_inStreamTop_V_keep_V_V_cap_bc;
static AESL_RUNTIME_BC __xlx_inStreamTop_V_keep_V_V_size_Reader("../tv/stream_size/stream_size_in_inStreamTop_V_keep_V.dat");
unsigned int ap_apatb_inStreamTop_V_strb_V_V_cap_bc;
static AESL_RUNTIME_BC __xlx_inStreamTop_V_strb_V_V_size_Reader("../tv/stream_size/stream_size_in_inStreamTop_V_strb_V.dat");
unsigned int ap_apatb__V_cap_bc;
static AESL_RUNTIME_BC __xlx__V_size_Reader("../tv/stream_size/stream_size_in_.dat");
unsigned int ap_apatb_inStreamTop_V_last_V_V_cap_bc;
static AESL_RUNTIME_BC __xlx_inStreamTop_V_last_V_V_size_Reader("../tv/stream_size/stream_size_in_inStreamTop_V_last_V.dat");
unsigned int ap_apatb__V_cap_bc;
static AESL_RUNTIME_BC __xlx__V_size_Reader("../tv/stream_size/stream_size_in_.dat");
unsigned int ap_apatb__V_cap_bc;
static AESL_RUNTIME_BC __xlx__V_size_Reader("../tv/stream_size/stream_size_in_.dat");
extern "C" void example(long long*, volatile void *, volatile void *, volatile void *, , volatile void *, , , int);
extern "C" void apatb_example_hw(volatile void * __xlx_apatb_param_inStreamTop_V_data_V, volatile void * __xlx_apatb_param_inStreamTop_V_keep_V, volatile void * __xlx_apatb_param_inStreamTop_V_strb_V, volatile void * __xlx_apatb_param_inStreamTop_V_last_V, volatile void * __xlx_apatb_param_outTop) {
  // Collect __xlx_outTop__tmp_vec
  vector<sc_bv<64> >__xlx_outTop__tmp_vec;
  for (int j = 0, e = 1024; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_outTop)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_outTop)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_outTop)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_outTop)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_outTop)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_outTop)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_outTop)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_outTop)[j*8+7];
    __xlx_outTop__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_outTop = 1024;
  int __xlx_offset_param_outTop = 0;
  int __xlx_offset_byte_param_outTop = 0*8;
  long long* __xlx_outTop__input_buffer= new long long[__xlx_outTop__tmp_vec.size()];
  for (int i = 0; i < __xlx_outTop__tmp_vec.size(); ++i) {
    __xlx_outTop__input_buffer[i] = __xlx_outTop__tmp_vec[i].range(63, 0).to_uint64();
  }
  // collect __xlx_inStreamTop_V_data_V_tmp_vec
  unsigned __xlx_inStreamTop_V_data_V_V_tmp_Count = 0;
  unsigned __xlx_inStreamTop_V_data_V_V_read_Size = __xlx_inStreamTop_V_data_V_V_size_Reader.read_size();
  vector<long long> __xlx_inStreamTop_V_data_V_tmp_vec;
  while (!((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->empty() && __xlx_inStreamTop_V_data_V_V_tmp_Count < __xlx_inStreamTop_V_data_V_V_read_Size) {
    __xlx_inStreamTop_V_data_V_tmp_vec.push_back(((hls::stream<long long>*)__xlx_apatb_param_inStreamTop_V_data_V)->read());
    __xlx_inStreamTop_V_data_V_V_tmp_Count++;
  }
  ap_apatb_inStreamTop_V_data_V_V_cap_bc = __xlx_inStreamTop_V_data_V_tmp_vec.size();
  // store input buffer
  long long* __xlx_inStreamTop_V_data_V_input_buffer= new long long[__xlx_inStreamTop_V_data_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_inStreamTop_V_data_V_tmp_vec.size(); ++i) {
    __xlx_inStreamTop_V_data_V_input_buffer[i] = __xlx_inStreamTop_V_data_V_tmp_vec[i];
  }
  // collect __xlx_inStreamTop_V_keep_V_tmp_vec
  unsigned __xlx_inStreamTop_V_keep_V_V_tmp_Count = 0;
  unsigned __xlx_inStreamTop_V_keep_V_V_read_Size = __xlx_inStreamTop_V_keep_V_V_size_Reader.read_size();
  vector<char> __xlx_inStreamTop_V_keep_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->empty() && __xlx_inStreamTop_V_keep_V_V_tmp_Count < __xlx_inStreamTop_V_keep_V_V_read_Size) {
    __xlx_inStreamTop_V_keep_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->read());
    __xlx_inStreamTop_V_keep_V_V_tmp_Count++;
  }
  ap_apatb_inStreamTop_V_keep_V_V_cap_bc = __xlx_inStreamTop_V_keep_V_tmp_vec.size();
  // store input buffer
  char* __xlx_inStreamTop_V_keep_V_input_buffer= new char[__xlx_inStreamTop_V_keep_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_inStreamTop_V_keep_V_tmp_vec.size(); ++i) {
    __xlx_inStreamTop_V_keep_V_input_buffer[i] = __xlx_inStreamTop_V_keep_V_tmp_vec[i];
  }
  // collect __xlx_inStreamTop_V_strb_V_tmp_vec
  unsigned __xlx_inStreamTop_V_strb_V_V_tmp_Count = 0;
  unsigned __xlx_inStreamTop_V_strb_V_V_read_Size = __xlx_inStreamTop_V_strb_V_V_size_Reader.read_size();
  vector<char> __xlx_inStreamTop_V_strb_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->empty() && __xlx_inStreamTop_V_strb_V_V_tmp_Count < __xlx_inStreamTop_V_strb_V_V_read_Size) {
    __xlx_inStreamTop_V_strb_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->read());
    __xlx_inStreamTop_V_strb_V_V_tmp_Count++;
  }
  ap_apatb_inStreamTop_V_strb_V_V_cap_bc = __xlx_inStreamTop_V_strb_V_tmp_vec.size();
  // store input buffer
  char* __xlx_inStreamTop_V_strb_V_input_buffer= new char[__xlx_inStreamTop_V_strb_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_inStreamTop_V_strb_V_tmp_vec.size(); ++i) {
    __xlx_inStreamTop_V_strb_V_input_buffer[i] = __xlx_inStreamTop_V_strb_V_tmp_vec[i];
  }
  // collect __xlx_inStreamTop_V_last_V_tmp_vec
  unsigned __xlx_inStreamTop_V_last_V_V_tmp_Count = 0;
  unsigned __xlx_inStreamTop_V_last_V_V_read_Size = __xlx_inStreamTop_V_last_V_V_size_Reader.read_size();
  vector<char> __xlx_inStreamTop_V_last_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->empty() && __xlx_inStreamTop_V_last_V_V_tmp_Count < __xlx_inStreamTop_V_last_V_V_read_Size) {
    __xlx_inStreamTop_V_last_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->read());
    __xlx_inStreamTop_V_last_V_V_tmp_Count++;
  }
  ap_apatb_inStreamTop_V_last_V_V_cap_bc = __xlx_inStreamTop_V_last_V_tmp_vec.size();
  // store input buffer
  char* __xlx_inStreamTop_V_last_V_input_buffer= new char[__xlx_inStreamTop_V_last_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_inStreamTop_V_last_V_tmp_vec.size(); ++i) {
    __xlx_inStreamTop_V_last_V_input_buffer[i] = __xlx_inStreamTop_V_last_V_tmp_vec[i];
  }
  // DUT call
  example(__xlx_outTop__input_buffer, __xlx_inStreamTop_V_data_V_input_buffer, __xlx_inStreamTop_V_keep_V_input_buffer, __xlx_inStreamTop_V_strb_V_input_buffer, __xlx_inStreamTop_V_last_V_input_buffer, __xlx_offset_byte_param_outTop);
// print __xlx_apatb_param_outTop
  sc_bv<64>*__xlx_outTop_output_buffer = new sc_bv<64>[__xlx_size_param_outTop];
  for (int i = 0; i < __xlx_size_param_outTop; ++i) {
    __xlx_outTop_output_buffer[i] = __xlx_outTop__input_buffer[i+__xlx_offset_param_outTop];
  }
  for (int i = 0; i < __xlx_size_param_outTop; ++i) {
    ((char*)__xlx_apatb_param_outTop)[i*8+0] = __xlx_outTop_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+1] = __xlx_outTop_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+2] = __xlx_outTop_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+3] = __xlx_outTop_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+4] = __xlx_outTop_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+5] = __xlx_outTop_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+6] = __xlx_outTop_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_outTop)[i*8+7] = __xlx_outTop_output_buffer[i].range(63, 56).to_uint();
  }
}
