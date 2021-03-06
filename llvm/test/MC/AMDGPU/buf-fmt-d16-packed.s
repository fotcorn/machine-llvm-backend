// RUN: llvm-mc -arch=amdgcn -mcpu=gfx810 -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=PACKED %s
// RUN: llvm-mc -arch=amdgcn -mcpu=gfx900 -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=PACKED %s

// RUN: not llvm-mc -arch=amdgcn -mcpu=fiji -show-encoding 2>&1 %s | FileCheck -check-prefix=UNPACKED-ERR -check-prefix=GCN-ERR %s


//===----------------------------------------------------------------------===//
// Buffer Format Instructions.
//===----------------------------------------------------------------------===//

buffer_load_format_d16_x v1, off, s[4:7], s1
// PACKED: buffer_load_format_d16_x v1, off, s[4:7], s1 ; encoding: [0x00,0x00,0x20,0xe0,0x00,0x01,0x01,0x01]

buffer_load_format_d16_xy v1, off, s[4:7], s1
// PACKED: buffer_load_format_d16_xy v1, off, s[4:7], s1 ; encoding: [0x00,0x00,0x24,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

buffer_load_format_d16_xyz v[1:2], off, s[4:7], s1
// PACKED: buffer_load_format_d16_xyz v[1:2], off, s[4:7], s1 ; encoding: [0x00,0x00,0x28,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

buffer_load_format_d16_xyzw v[1:2], off, s[4:7], s1
// PACKED: buffer_load_format_d16_xyzw v[1:2], off, s[4:7], s1 ; encoding: [0x00,0x00,0x2c,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

buffer_store_format_d16_x v1, off, s[4:7], s1
// PACKED: buffer_store_format_d16_x v1, off, s[4:7], s1 ; encoding: [0x00,0x00,0x30,0xe0,0x00,0x01,0x01,0x01]

buffer_store_format_d16_xy v1, off, s[4:7], s1
// PACKED: buffer_store_format_d16_xy v1, off, s[4:7], s1 ; encoding: [0x00,0x00,0x34,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

buffer_store_format_d16_xyz v[1:2], off, s[4:7], s1
// PACKED: buffer_store_format_d16_xyz v[1:2], off, s[4:7], s1 ; encoding: [0x00,0x00,0x38,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

buffer_store_format_d16_xyzw v[1:2], off, s[4:7], s1
// PACKED: buffer_store_format_d16_xyzw v[1:2], off, s[4:7], s1 ; encoding: [0x00,0x00,0x3c,0xe0,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU


//===----------------------------------------------------------------------===//
// TBuffer Format Instructions.
//===----------------------------------------------------------------------===//

tbuffer_load_format_d16_x v1, off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_load_format_d16_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7c,0xe9,0x00,0x01,0x01,0x01]

tbuffer_load_format_d16_xy v1, off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_load_format_d16_xy v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7c,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

tbuffer_load_format_d16_xyz v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_load_format_d16_xyz v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7d,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

tbuffer_load_format_d16_xyzw v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_load_format_d16_xyzw v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7d,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

tbuffer_store_format_d16_x v1, off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_store_format_d16_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7e,0xe9,0x00,0x01,0x01,0x01]

tbuffer_store_format_d16_xy v1, off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_store_format_d16_xy v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7e,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

tbuffer_store_format_d16_xyz v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_store_format_d16_xyz v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7f,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU

tbuffer_store_format_d16_xyzw v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// PACKED: tbuffer_store_format_d16_xyzw v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7f,0xe9,0x00,0x01,0x01,0x01]
// UNPACKED-ERR: error: instruction not supported on this GPU
