package com.rainng.coursesystem;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.rainng.coursesystem.util.*;

@SpringBootTest
class RainngCourseSystemApplicationTests {
    @Test
    void contextLoads() {
        System.out.println(new Md5Encrypt().computeHexString("123456"));
    }
}
