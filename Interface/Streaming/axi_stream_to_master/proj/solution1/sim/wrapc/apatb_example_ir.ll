; ModuleID = '/home/zyt/example/Vitis-HLS-Introductory-Examples/Interface/Streaming/axi_stream_to_master/proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream.6" = type { %"struct.hls::axis" }
%"struct.hls::axis" = type { %struct.ap_int, %struct.ap_uint.7, %struct.ap_uint.7, %struct.ap_int.0, %struct.ap_int.0, %struct.ap_int.0, %struct.ap_int.0 }
%struct.ap_int = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int }
%struct.ssdm_int = type { i64 }
%struct.ap_uint.7 = type { %struct.ap_int_base.8 }
%struct.ap_int_base.8 = type { %struct.ssdm_int.9 }
%struct.ssdm_int.9 = type { i8 }
%struct.ap_int.0 = type { %struct.ap_int_base.1 }
%struct.ap_int_base.1 = type { %struct.ssdm_int.2 }
%struct.ssdm_int.2 = type { i1 }

; Function Attrs: noinline
define void @apatb_example_ir(%"class.hls::stream.6"* %inStreamTop, %struct.ap_int* %outTop) local_unnamed_addr #0 {
entry:
  %inStreamTop_copy.data = alloca i64
  %inStreamTop_copy.keep = alloca i8
  %inStreamTop_copy.strb = alloca i8
  %inStreamTop_copy.last = alloca i1
  %malloccall = call i8* @malloc(i64 8192)
  %outTop_copy = bitcast i8* %malloccall to [1024 x i64]*
  %0 = bitcast %struct.ap_int* %outTop to [1024 x %struct.ap_int]*
  call fastcc void @copy_in(%"class.hls::stream.6"* %inStreamTop, i64* %inStreamTop_copy.data, i8* %inStreamTop_copy.keep, i8* %inStreamTop_copy.strb, i1* %inStreamTop_copy.last, [1024 x %struct.ap_int]* %0, [1024 x i64]* %outTop_copy)
  %1 = getelementptr [1024 x i64], [1024 x i64]* %outTop_copy, i32 0, i32 0
  call void @apatb_example_hw(i64* %inStreamTop_copy.data, i8* %inStreamTop_copy.keep, i8* %inStreamTop_copy.strb, i1* %inStreamTop_copy.last, i64* %1)
  call fastcc void @copy_out(%"class.hls::stream.6"* %inStreamTop, i64* %inStreamTop_copy.data, i8* %inStreamTop_copy.keep, i8* %inStreamTop_copy.strb, i1* %inStreamTop_copy.last, [1024 x %struct.ap_int]* %0, [1024 x i64]* %outTop_copy)
  call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream.6"*, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, [1024 x %struct.ap_int]* readonly, [1024 x i64]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.6.12"(i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream.6"* %0)
  call fastcc void @onebyonecpy_hls.p0a1024struct.ap_int([1024 x i64]* %2, [1024 x %struct.ap_int]* %1)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.6"(%"class.hls::stream.6"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream.6"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream.6"(%"class.hls::stream.6"* nonnull align 512 %0, i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.6"(%"class.hls::stream.6"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream.6"
  %2 = alloca i64
  %3 = alloca i8
  %4 = alloca i8
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast i64* %_V_data_V to i8*
  %7 = call i1 @fpga_fifo_not_empty_8(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast i64* %2 to i8*
  %9 = bitcast i64* %_V_data_V to i8*
  call void @fpga_fifo_pop_8(i8* %8, i8* %9)
  %10 = load volatile i64, i64* %2
  %11 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 0
  %12 = bitcast %struct.ap_int* %11 to i64*
  store i64 %10, i64* %12
  call void @fpga_fifo_pop_1(i8* %4, i8* %_V_keep_V)
  %13 = load volatile i8, i8* %4
  %14 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 1
  %15 = bitcast %struct.ap_uint.7* %14 to i8*
  store i8 %13, i8* %15
  call void @fpga_fifo_pop_1(i8* %3, i8* %_V_strb_V)
  %16 = load volatile i8, i8* %3
  %17 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 2
  %18 = bitcast %struct.ap_uint.7* %17 to i8*
  store i8 %16, i8* %18
  %19 = bitcast i1* %5 to i8*
  %20 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %19, i8* %20)
  %21 = bitcast i1* %5 to i8*
  %22 = load i8, i8* %21
  %23 = trunc i8 %22 to i1
  %24 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %struct.ap_int.0* %24 to i1*
  store i1 %23, i1* %25
  %26 = bitcast %"class.hls::stream.6"* %1 to i8*
  %27 = bitcast %"class.hls::stream.6"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1024struct.ap_int([1024 x i64]* noalias, [1024 x %struct.ap_int]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1024 x i64]* %0, null
  %3 = icmp eq [1024 x %struct.ap_int]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx9 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %5 = getelementptr [1024 x i64], [1024 x i64]* %0, i64 0, i64 %for.loop.idx9
  %src.addr.0.0.05.gep8 = getelementptr [1024 x %struct.ap_int], [1024 x %struct.ap_int]* %1, i64 0, i64 %for.loop.idx9, i32 0, i32 0, i32 0
  %6 = load i64, i64* %src.addr.0.0.05.gep8, align 8
  store i64 %6, i64* %5, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx9, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream.6"*, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, [1024 x %struct.ap_int]*, [1024 x i64]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.6"(%"class.hls::stream.6"* %0, i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @onebyonecpy_hls.p0a1024struct.ap_int.6([1024 x %struct.ap_int]* %1, [1024 x i64]* %2)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1024struct.ap_int.6([1024 x %struct.ap_int]* noalias, [1024 x i64]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1024 x %struct.ap_int]* %0, null
  %3 = icmp eq [1024 x i64]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx9 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.0.0.06.gep7 = getelementptr [1024 x %struct.ap_int], [1024 x %struct.ap_int]* %0, i64 0, i64 %for.loop.idx9, i32 0, i32 0, i32 0
  %5 = getelementptr [1024 x i64], [1024 x i64]* %1, i64 0, i64 %for.loop.idx9
  %6 = load i64, i64* %5, align 8
  store i64 %6, i64* %dst.addr.0.0.06.gep7, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx9, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.6.12"(i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream.6"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream.6"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream.6.15"(i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream.6"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.6.15"(i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream.6"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream.6"
  %2 = alloca %"class.hls::stream.6"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.6"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.6"* %2 to i8*
  %6 = bitcast %"class.hls::stream.6"* %0 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.6", %"class.hls::stream.6"* %2
  store %"class.hls::stream.6" %7, %"class.hls::stream.6"* %1
  %8 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %struct.ap_int* %8 to i64*
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i64* %_V_data_V to i8*
  call void @fpga_fifo_push_8(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %struct.ap_uint.7* %12 to i8*
  call void @fpga_fifo_push_1(i8* %13, i8* %_V_keep_V)
  %14 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 2
  %15 = bitcast %struct.ap_uint.7* %14 to i8*
  call void @fpga_fifo_push_1(i8* %15, i8* %_V_strb_V)
  %16 = getelementptr inbounds %"class.hls::stream.6", %"class.hls::stream.6"* %1, i32 0, i32 0, i32 4
  %17 = bitcast %struct.ap_int.0* %16 to i1*
  %18 = bitcast i1* %17 to i8*
  %19 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_example_hw(i64*, i8*, i8*, i1*, i64*)

define void @example_hw_stub_wrapper(i64*, i8*, i8*, i1*, i64*) #5 {
entry:
  %5 = alloca %"class.hls::stream.6"
  %malloccall = tail call i8* @malloc(i64 8192)
  %6 = bitcast i8* %malloccall to [1024 x %struct.ap_int]*
  %7 = bitcast i64* %4 to [1024 x i64]*
  call void @copy_out(%"class.hls::stream.6"* %5, i64* %0, i8* %1, i8* %2, i1* %3, [1024 x %struct.ap_int]* %6, [1024 x i64]* %7)
  %8 = bitcast [1024 x %struct.ap_int]* %6 to %struct.ap_int*
  call void @example_hw_stub(%"class.hls::stream.6"* %5, %struct.ap_int* %8)
  call void @copy_in(%"class.hls::stream.6"* %5, i64* %0, i8* %1, i8* %2, i1* %3, [1024 x %struct.ap_int]* %6, [1024 x i64]* %7)
  ret void
}

declare void @example_hw_stub(%"class.hls::stream.6"*, %struct.ap_int*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
