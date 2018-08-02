# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=i686-unknown-unknown -mcpu=skylake-avx512 -instruction-tables < %s | FileCheck %s

aaa

aad
aad $7

aam
aam $7

aas

bound %bx, (%eax)
bound %ebx, (%eax)

daa

das

into

leave

salc

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      100   0.25                        aaa
# CHECK-NEXT:  1      100   0.25                        aad
# CHECK-NEXT:  1      100   0.25                        aad	$7
# CHECK-NEXT:  1      100   0.25                        aam
# CHECK-NEXT:  1      100   0.25                        aam	$7
# CHECK-NEXT:  1      100   0.25                        aas
# CHECK-NEXT:  1      100   0.25                  U     bound	%bx, (%eax)
# CHECK-NEXT:  1      100   0.25                  U     bound	%ebx, (%eax)
# CHECK-NEXT:  1      100   0.25                        daa
# CHECK-NEXT:  1      100   0.25                        das
# CHECK-NEXT:  1      100   0.25                  U     into
# CHECK-NEXT:  3      7     0.50    *                   leave
# CHECK-NEXT:  1      1     0.25                  U     salc

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SKXDivider
# CHECK-NEXT: [1]   - SKXFPDivider
# CHECK-NEXT: [2]   - SKXPort0
# CHECK-NEXT: [3]   - SKXPort1
# CHECK-NEXT: [4]   - SKXPort2
# CHECK-NEXT: [5]   - SKXPort3
# CHECK-NEXT: [6]   - SKXPort4
# CHECK-NEXT: [7]   - SKXPort5
# CHECK-NEXT: [8]   - SKXPort6
# CHECK-NEXT: [9]   - SKXPort7

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]
# CHECK-NEXT:  -      -     3.50   3.50   0.50   0.50    -     3.50   3.50    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    Instructions:
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aaa
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aad
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aad	$7
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aam
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aam	$7
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     aas
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     bound	%bx, (%eax)
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     bound	%ebx, (%eax)
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     daa
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     das
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     into
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -     0.50   0.50    -     leave
# CHECK-NEXT:  -      -     0.25   0.25    -      -      -     0.25   0.25    -     salc
