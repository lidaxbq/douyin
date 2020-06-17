package com.lida.dy.controller;

import com.alibaba.fastjson.JSONObject;
import com.lida.dy.model.entity.UserEntity;
import com.lida.dy.service.UserSerivce;
import com.lida.dy.serviceImpl.RedisService;
import com.lida.dy.tool.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Auther: lida
 * @Description:
 * @Date 2020/1/15 0015 21:38
 * @Version: 1.0
 */
@Controller
@RequestMapping("/login")
@Slf4j
public class LoginController {
    @Autowired
    UserSerivce userSerivce;
    @Autowired
    RedisService redisService;

    /**
     * 请求验证找回密码
     *
     * @param data
     * @return
     */
    @PostMapping("/findPasswd/inputInfo")
    @ResponseBody
    public Result findPasswd(@RequestParam String data) {
        if (data != null) {
            data = data.trim();
            String phoneRegex = "0\\d{2,3}[-]?\\d{7,8}|0\\d{2,3}\\s?\\d{7,8}|13[0-9]\\d{8}|15[1089]\\d{8}";
            Pattern phonePattern = Pattern.compile(phoneRegex);
            Matcher phoneMatcher = phonePattern.matcher(data);

            String emailRegex = "(?:[0-9a-zA-Z_]+.)+@[0-9a-zA-Z]{1,13}\\.[com,cn,net]{1,3}";
            Pattern emailPattern = Pattern.compile(emailRegex);
            Matcher emailMatcher = emailPattern.matcher(data);
            if (phoneMatcher.matches()) {
                boolean b = userSerivce.existPhone(data);
                if (b) {
                    //todo 发送短信验证码 找回密码
                    return Result.success("已向该手机号码发送验证码");
                }
            } else if (emailMatcher.matches()) {
                UserEntity userEntity = userSerivce.existEmail(data);
                if (userEntity != null) {
                    log.info("findPasswd() userEntity {}", userEntity.toString());
                    String key = redisService.sendEmail(userEntity);
                    if (key == null) {
                        return Result.fail("请勿频繁发送验证码");
                    }
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("key", key);
                    return Result.success(jsonObject);
                }else{
                    return Result.fail("该邮箱已注册");
                }
            }

        }
        return Result.fail();
    }

    /**
     * 获取上传的验证码
     *
     * @param key
     * @param code
     * @return
     */
    @PostMapping("/findPasswd/verificate")
    @ResponseBody
    public Result findPasswdVerificate(@RequestParam String key, @RequestParam String code, @RequestParam String passwd) {
        if (key != null && code != null) {
            int id = redisService.checkVerificationCode(key, code);
            if (id > -1) {
                userSerivce.updatePasswd(id, passwd);
                System.out.println(key + code + "::::" + passwd);
                return Result.success();
            }
        }
        return Result.fail();
    }

}
