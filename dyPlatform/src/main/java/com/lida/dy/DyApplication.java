package com.lida.dy;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@Slf4j
public class DyApplication {

    public static void main(String[] args) {
        SpringApplication.run(DyApplication.class, args);
    }

    /**
     * 应用启动后的回调
     * @return
     */
    @Bean
    public ApplicationRunner applicationRunner() {
        return args -> {
            log.info("ApplicationRunner实现");
        };
    }
}
