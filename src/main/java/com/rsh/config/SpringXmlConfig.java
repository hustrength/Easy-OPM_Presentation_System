package com.rsh.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource(locations = {"/spring-beans.xml"})
public class SpringXmlConfig {
}
