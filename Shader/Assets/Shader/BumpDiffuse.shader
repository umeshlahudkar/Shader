Shader "Custom/BumpDiffuse"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _BumpTex("Bump Tex", 2D) = "bump" {}
    }
    SubShader
    {
      

        CGPROGRAM
        #pragma surface surf Lambert

      

        sampler2D _MainTex;
        sampler2D _BumpTex;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = (tex2D(_MainTex, IN.uv_MainTex)).rgb;
            o.Normal = UnpackNormal(tex2D(_MainTex, IN.uv_MainTex));
        }
        ENDCG
    }
    FallBack "Diffuse"
}
