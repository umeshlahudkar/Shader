Shader "Custom/Hologram"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0,0.5,0.5,0)
        _RimPower ("Rim power", Range(0.5, 8.0)) = 1.0
       
    }
    SubShader
    {
       Tags{"Queue" = "Transparent"}

       Pass {
            Zwrite On
            ColorMask 0
       }

       CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        struct Input
        {
            float3 viewDir;
        };

       
        fixed4 _RimColor;
        half _RimPower;
     

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor * pow(rim, _RimPower) * 10;
            o.Alpha = pow(rim, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
