package com.example;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.ws.transport.http.MessageDispatcherServlet;
import org.springframework.xml.xsd.SimpleXsdSchema;
import org.springframework.xml.xsd.XsdSchema;
import org.springframework.ws.wsdl.wsdl11.DefaultWsdl11Definition;

@Configuration
public class WebServiceConfig {

	@Bean
	public ServletRegistrationBean<MessageDispatcherServlet> customMessageDispatcherServlet(ApplicationContext applicationContext) {
		   MessageDispatcherServlet servlet = new MessageDispatcherServlet();
		   servlet.setApplicationContext(applicationContext);
		   servlet.setTransformWsdlLocations(true);
		   return new ServletRegistrationBean<>(servlet, "/ws/*");
		}

    @Bean(name = "estudiantes")
    public DefaultWsdl11Definition defaultWsdl11Definition(XsdSchema estudiantesSchema) {
        DefaultWsdl11Definition def = new DefaultWsdl11Definition();
        def.setPortTypeName("EstudiantesPort");
        def.setLocationUri("/ws");
        def.setTargetNamespace("http://example.com/EC01_Soap_Estudiantes");
        def.setSchema(estudiantesSchema);
        return def;
    }

    @Bean
    public XsdSchema estudiantesSchema() {
        return new SimpleXsdSchema(new ClassPathResource("estudiantes.xsd"));
    }
}

