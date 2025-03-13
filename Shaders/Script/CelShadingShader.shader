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
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

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

                half4 textureColor = SAMPLE_TEXTURE2D(_mainTexture, sampler_mainTexture, IN.uv);
                float3 baseColor = textureColor.rgb * _mainColor.rgb;

                Light mainLight = GetMainLight();
                float mainLightDiffuse = dot(mainLight.direction, normal);
                float3 celShadingCutoff = lerp(_ambientLightStrength,
                                                1.0f,
                                                smoothstep(_cutoffTresholds.x, _cutoffTresholds.y, mainLightDiffuse)) * mainLight.color;

                float3 lightColor = 0.0f;
                int lightCount = _AdditionalLightsCount;
                for (int i = 0; i < lightCount; ++i)
                {
                    
                }
                
                return half4(baseColor * celShadingCutoff, 1.0f);
            }
            ENDHLSL
        }
    }
}