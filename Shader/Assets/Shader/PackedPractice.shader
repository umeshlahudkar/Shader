Shader "Custom/PackedPractice"
{
    Properties
    {
        _MyColor("My Color", Color) = (1,1,1,1)
        _MyTex("Texture", 2D) = "white" {}
        _MyRange ("My Range", Range(0, 5)) = 1
        _MyCube ("My Cube", CUBE) = "" {}
    }

    SubShader{

        CGPROGRAM
           #pragma surface surf Lambert

           fixed4 _MyColor;
           sampler2D _MyTex;
           samplerCUBE _MyCube;
           half _MyRange;

           struct Input {
                float2 uv_MyTex;
                float3 worldRefl;
           };

           void surf(Input IN, inout SurfaceOutput o) {
               fixed4 clr = tex2D(_MyTex, IN.uv_MyTex) * _MyRange;
               o.Albedo = clr.rgb * _MyColor.rgb;

              fixed4 emCclr = texCUBE(_MyCube, IN.worldRefl);
              o.Emission = emCclr.rgb;
           }

        ENDCG
    }
  
    FallBack "Diffuse"
}
