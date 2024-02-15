Shader "Custom/RimLighting"
{
    Properties
    {
        _Color ("Rim Color", Color) = (1,1,1,1)
        _RimPower("Rim Color", Range(0.5, 8.0)) = 3.0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        
         fixed4 _Color;
         half _RimPower;

        struct Input
        {
            float3 viewDir;
        };
   
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _Color.rgb * rim > 0.5 ? rim : 0;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
