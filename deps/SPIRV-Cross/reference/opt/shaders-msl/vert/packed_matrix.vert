#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

typedef packed_float4 packed_rm_float4x3[3];

struct _15
{
    packed_rm_float4x3 _m0;
    packed_rm_float4x3 _m1;
};

struct _42
{
    float4x4 _m0;
    float4x4 _m1;
    float _m2;
    char _m3_pad[12];
    packed_float3 _m3;
    float _m4;
    packed_float3 _m5;
    float _m6;
    float _m7;
    float _m8;
    float2 _m9;
};

struct main0_out
{
    float3 m_72 [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct main0_in
{
    float4 m_25 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant _15& _17 [[buffer(0)]], constant _42& _44 [[buffer(1)]])
{
    main0_out out = {};
    float4 _70 = _44._m0 * float4(float3(_44._m3) + (in.m_25.xyz * (_44._m6 + _44._m7)), 1.0);
    out.m_72 = normalize(float4(in.m_25.xyz, 0.0) * float3x4(float4(_17._m1[0]), float4(_17._m1[1]), float4(_17._m1[2])));
    float4 _94 = _70;
    _94.y = -_70.y;
    out.gl_Position = _94;
    return out;
}

