Shader "logandlp/CustomShaders/CelShading"
{
    Properties
    {
        _mainColor("Main Color", Color) = (1, 1, 1, 1)
        _mainTexture("Texture", 2D) = "white" {}
        _cutoffTresholds("Cutoff Tresholds", Vector) = (-0.05, 0.05, 0.0, 0.0)
        _ambientLightStrength("Ambient Light Strength", Range(0.0, 1.0)) = 0.005
    }
    
    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalRenderPipeline" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            CBUFFER_START(UnityPerMaterial)
                half4 _mainColor;
                float2 _cutoffTresholds;
                float _ambientLightStrength;
            CBUFFER_END

            TEXTURE2D(_mainTexture);
            SAMPLER(sampler_mainTexture);
            
            struct Attributes
            {
                float4 positionOS   : POSITION;
                float3 normalOS     : NORMAL;
                float2 uv           : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS  : SV_POSITION;
                float3 worldPos     : TEXCOORD2;
                float3 normalWS     : TEXCOORD1;
                float2 uv           : TEXCOORD0;
            };            
            
            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                
                    OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                    OUT.worldPos = TransformObjectToWorld(IN.positionOS.xyz);
                    OUT.normalWS = TransformObjectToWorldNormal(IN.normalOS);
                    OUT.uv = IN.uv;
                
                return OUT;
            }
            
            half4 frag(Varyings IN) : SV_Target
            {
                float3 normal = normalize(IN.normalWS);
                float3 worldPosition = IN.worldPos;
                
                half4 customColor;
                customColor = half4(0.5, 0, 0, 1);
                return customColor;
            }
            ENDHLSL
        }
    }
}