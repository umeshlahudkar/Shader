Shader "Custom/HelloShader" 
{
	Properties{
		_MyColor("My Color", Color) = (1,1,1,1)
		_MyEmission("My Emission", Color) = (1,1,1,1)
		_MyNormal("My Normal", Color) = (1,1,1,1)
	}

    SubShader{

		CGPROGRAM
           #pragma surface surf Lambert

		struct Input {
			float2 uvMainTex;
        };

	    fixed4 _MyColor;
		fixed4 _MyEmission;
		fixed4 _MyNormal;

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _MyColor.rgb;
			o.Emission = _MyEmission.rgb;
			o.Normal = _MyNormal.rgb;
		}

		ENDCG

	}
	FallBack "Diffuse"
}