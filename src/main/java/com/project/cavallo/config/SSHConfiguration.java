package com.project.cavallo.config;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.springframework.context.annotation.Configuration;

import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.Properties;
import java.util.Set;

@Configuration
public class SSHConfiguration implements ServletContainerInitializer {

    public SSHConfiguration() {
        try {
            Properties p = new Properties();
            p.load(getClass().getResourceAsStream("/application.properties"));
            if (p.getProperty("ssh.forward.enabled") != null) {
                Session session = new JSch().getSession(p.getProperty("ssh.forward.username"), p.getProperty("ssh.forward.host"), Integer.parseInt(p.getProperty("ssh.forward.port")));
                session.setConfig("StrictHostKeyChecking", "no");
                session.setPassword(p.getProperty("ssh.forward.password"));
                session.connect();
                session.setPortForwardingL(p.getProperty("ssh.forward.from_host"), Integer.parseInt(p.getProperty("ssh.forward.from_port")), p.getProperty("ssh.forward.to_host"), Integer.parseInt(p.getProperty("ssh.forward.to_port")));
            }
        } catch (IOException | JSchException e) {
        }
    }

    @Override
    public void onStartup(Set<Class<?>> set, ServletContext servletContext) throws ServletException {
    }
}
