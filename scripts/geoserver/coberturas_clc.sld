<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>coberturas_clc</Name>
    <UserStyle>
      <Title>Coberturas CLC - GEODATA INSIGHTS</Title>
      <Abstract>Leyenda oficial Corine Land Cover nivel 1 (adaptada Colombia)</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>1 - Zonas artificiales</Name>
          <Title>1. Zonas artificiales</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escape="\">
              <ogc:PropertyName>descripcion</ogc:PropertyName>
              <ogc:Literal>1.%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill><CssParameter name="fill">#D64550</CssParameter><CssParameter name="fill-opacity">0.75</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#8E2429</CssParameter><CssParameter name="stroke-width">0.6</CssParameter></Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>2 - Zonas agropecuarias</Name>
          <Title>2. Zonas agropecuarias</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escape="\">
              <ogc:PropertyName>descripcion</ogc:PropertyName>
              <ogc:Literal>2.%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill><CssParameter name="fill">#F2C531</CssParameter><CssParameter name="fill-opacity">0.75</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#A98A16</CssParameter><CssParameter name="stroke-width">0.6</CssParameter></Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>3 - Bosques y areas naturales</Name>
          <Title>3. Bosques y areas naturales</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escape="\">
              <ogc:PropertyName>descripcion</ogc:PropertyName>
              <ogc:Literal>3.%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill><CssParameter name="fill">#43A047</CssParameter><CssParameter name="fill-opacity">0.75</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#256A2A</CssParameter><CssParameter name="stroke-width">0.6</CssParameter></Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>4 - Humedales</Name>
          <Title>4. Humedales</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escape="\">
              <ogc:PropertyName>descripcion</ogc:PropertyName>
              <ogc:Literal>4.%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill><CssParameter name="fill">#7CD5EF</CssParameter><CssParameter name="fill-opacity">0.75</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#3E97AD</CssParameter><CssParameter name="stroke-width">0.6</CssParameter></Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>5 - Cuerpos de agua</Name>
          <Title>5. Cuerpos de agua</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escape="\">
              <ogc:PropertyName>descripcion</ogc:PropertyName>
              <ogc:Literal>5.%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill><CssParameter name="fill">#1E88E5</CssParameter><CssParameter name="fill-opacity">0.8</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#0F5591</CssParameter><CssParameter name="stroke-width">0.6</CssParameter></Stroke>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
