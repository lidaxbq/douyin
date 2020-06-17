package com.lida.dy.controller;

import com.lida.dy.aspect.SecurityParameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: lida
 * @Description:
 * @Date 2020/1/3 0003 11:28
 * @Version: 1.0
 */
@Controller
public class TestController {
    @GetMapping("/a")
    public String test() {
        return "hello";

    }

    @SecurityParameter(decode = true)
    @PostMapping("/b")
    @ResponseBody
    public void b(@RequestParam String data, @RequestParam String a) {
        System.out.println("aaaaa" + data);
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @SecurityParameter(encode = true)
    @ResponseBody
    public Map get() throws Exception {
        Map map = new HashMap();
        map.put("code", "0");
        map.put("data", "entity");
        return map;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @SecurityParameter(decode = true, encode = true)
    public Map save(@RequestBody(required = false) String a) throws Exception {
        System.out.println(a);
        Map<String, String> map = new HashMap<String, String>();
        map.put("code", "0");
        return map;
    }
}
