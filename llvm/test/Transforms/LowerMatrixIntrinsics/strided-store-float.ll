; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -lower-matrix-intrinsics -S < %s | FileCheck %s
; RUN: opt -passes='lower-matrix-intrinsics' -S < %s | FileCheck %s

define void @strided_store_3x2(<6 x float> %in, float* %out) {
; CHECK-LABEL: @strided_store_3x2(
; CHECK-NEXT:    [[SPLIT:%.*]] = shufflevector <6 x float> [[IN:%.*]], <6 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
; CHECK-NEXT:    [[SPLIT1:%.*]] = shufflevector <6 x float> [[IN]], <6 x float> undef, <3 x i32> <i32 3, i32 4, i32 5>
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast float* [[OUT:%.*]] to <3 x float>*
; CHECK-NEXT:    store <3 x float> [[SPLIT]], <3 x float>* [[TMP1]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr float, float* [[OUT]], i32 5
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast float* [[TMP2]] to <3 x float>*
; CHECK-NEXT:    store <3 x float> [[SPLIT1]], <3 x float>* [[TMP3]], align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.matrix.columnwise.store(<6 x float> %in, float* %out, i32 5, i32 3, i32 2)
  ret void
}

define void @strided_store_3x2_nonconst_stride(<6 x float> %in, i32 %stride, float* %out) {
; CHECK-LABEL: @strided_store_3x2_nonconst_stride(
; CHECK-NEXT:    [[SPLIT:%.*]] = shufflevector <6 x float> [[IN:%.*]], <6 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
; CHECK-NEXT:    [[SPLIT1:%.*]] = shufflevector <6 x float> [[IN]], <6 x float> undef, <3 x i32> <i32 3, i32 4, i32 5>
; CHECK-NEXT:    [[TMP1:%.*]] = mul i32 0, [[STRIDE:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr float, float* [[OUT:%.*]], i32 [[TMP1]]
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast float* [[TMP2]] to <3 x float>*
; CHECK-NEXT:    store <3 x float> [[SPLIT]], <3 x float>* [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = mul i32 1, [[STRIDE]]
; CHECK-NEXT:    [[TMP5:%.*]] = getelementptr float, float* [[OUT]], i32 [[TMP4]]
; CHECK-NEXT:    [[TMP6:%.*]] = bitcast float* [[TMP5]] to <3 x float>*
; CHECK-NEXT:    store <3 x float> [[SPLIT1]], <3 x float>* [[TMP6]], align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.matrix.columnwise.store(<6 x float> %in, float* %out, i32 %stride, i32 3, i32 2)
  ret void
}


declare void @llvm.matrix.columnwise.store(<6 x float>, float*, i32, i32, i32)

define void @strided_store_2x3(<10 x float> %in, float* %out) {
; CHECK-LABEL: @strided_store_2x3(
; CHECK-NEXT:    [[SPLIT:%.*]] = shufflevector <10 x float> [[IN:%.*]], <10 x float> undef, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:    [[SPLIT1:%.*]] = shufflevector <10 x float> [[IN]], <10 x float> undef, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:    [[SPLIT2:%.*]] = shufflevector <10 x float> [[IN]], <10 x float> undef, <2 x i32> <i32 4, i32 5>
; CHECK-NEXT:    [[SPLIT3:%.*]] = shufflevector <10 x float> [[IN]], <10 x float> undef, <2 x i32> <i32 6, i32 7>
; CHECK-NEXT:    [[SPLIT4:%.*]] = shufflevector <10 x float> [[IN]], <10 x float> undef, <2 x i32> <i32 8, i32 9>
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast float* [[OUT:%.*]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[SPLIT]], <2 x float>* [[TMP1]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr float, float* [[OUT]], i32 4
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast float* [[TMP2]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[SPLIT1]], <2 x float>* [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr float, float* [[OUT]], i32 8
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast float* [[TMP4]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[SPLIT2]], <2 x float>* [[TMP5]], align 4
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr float, float* [[OUT]], i32 12
; CHECK-NEXT:    [[TMP7:%.*]] = bitcast float* [[TMP6]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[SPLIT3]], <2 x float>* [[TMP7]], align 4
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr float, float* [[OUT]], i32 16
; CHECK-NEXT:    [[TMP9:%.*]] = bitcast float* [[TMP8]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[SPLIT4]], <2 x float>* [[TMP9]], align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.matrix.columnwise.store.v10f32(<10 x float> %in, float* %out, i32 4, i32 2, i32 5)
  ret void
}

declare void @llvm.matrix.columnwise.store.v10f32(<10 x float>, float*, i32, i32, i32)
