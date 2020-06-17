package com.lida.dy.controller;

import com.lida.dy.conf.DefaultConfig;
import com.lida.dy.conf.SessionKey;
import com.lida.dy.model.entity.TalentUserInfoEntity;
import com.lida.dy.model.entity.UserEntity;
import com.lida.dy.serviceImpl.TalentUserService;
import com.lida.dy.serviceImpl.UserSerivceImpl;
import com.lida.dy.tool.Result;
import com.lida.dy.utils.MD5Util;
import com.lida.dy.utils.ToolUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 页面跳转
 *
 * @Auther: lida
 * @Description:
 * @Date 2020/1/3 0003 15:20
 * @Version: 1.0
 */
@Controller
public class PageController {
    @Autowired
    TalentUserService talentUserService;
    @Autowired
    CalculateController calculateController;
    @Autowired
    UserSerivceImpl userSerivce;
    @Autowired
    ToolUtil toolUtil;

    @GetMapping("/")
    public String index() {
        return "page/login";
    }

    @PostMapping("/login")
    public String login(Model model, HttpSession session, UserEntity userEntity) {
        String password = userEntity.getPasswd().trim();
        System.out.println(password);
        int mid = password.length() / 2;
        if (password.charAt(mid) == ',') {
            password = password.substring(0, mid);
        }
        if (password.charAt(password.length() - 1) == ',') {
            password = password.substring(0, password.length() - 1);
        }
        userEntity.setPasswd(password);
        System.out.println(userEntity.getPasswd());
        System.out.println(MD5Util.getMD5(userEntity.getPasswd()));
        UserEntity userEntity1 = userSerivce.checkByAccountPasswd(userEntity.getAccountNumber(), userEntity.getPasswd());
        if (userEntity1 != null) {
            if (userEntity1.getAccountNumber().equals(userEntity.getAccountNumber()) && userEntity1.getPasswd().equals(MD5Util.getMD5(userEntity.getPasswd()))) {
                session.setAttribute(SessionKey.loginUserField, userEntity1);
                String goal = "redirect:/index";
                return goal;
            }
        }
        model.addAttribute("login", false);
        return "page/login";
    }

    @GetMapping("/logout")
    public String login(Model model, HttpSession session) {
        session.removeAttribute(SessionKey.loginUserField);
        return "page/login";
    }

    @GetMapping("/register")
    public String login() {
        return "page/register";
    }

    /**
     * 重定向首页
     */
    @RequestMapping("/index")
    public String toindex() {
        return "page/index";
    }

//    @RequestMapping("/index/{page}/{size}")
//    public String index(HttpSession session, Model model, @PathVariable int page, @PathVariable int size) {
//        CandidateSearchVo candidateSearchVo = (CandidateSearchVo) session.getAttribute(SessionKey.searchByCandidateDataField);
//        Page<TalentUserInfoEntity> page1 = null;
//        if (candidateSearchVo != null) {
//            page1 = talentUserService.searchByCandidate(candidateSearchVo);
//        } else {
//            CandidateSearchVo candidateSearchVo1 = new CandidateSearchVo();
//            candidateSearchVo1.setPage(page);
//            candidateSearchVo1.setSize(size);
//            page1 = talentUserService.searchByCandidate(candidateSearchVo1);
//        }
//
//        model.addAttribute("userlist", page1);
//        return "page/index";
//    }


    @GetMapping("/talentInfo/{id}")
    public String talentInfo(Model model, HttpSession session, @PathVariable int id) {
        TalentUserInfoEntity talentUserInfoEntity = talentUserService.findById(id);
        toolUtil.wrapperTanlentUserInfo(talentUserInfoEntity);
        model.addAttribute("talentUser", talentUserInfoEntity);
        session.setAttribute(SessionKey.saveProfileField, id);
        return "page/profile";
    }

    @GetMapping("/talentInfo")
    public String talentInfoNoId(Model model, HttpSession session) {
        Integer id = (Integer) session.getAttribute(SessionKey.saveProfileField);
        if (id != null) {
            TalentUserInfoEntity talentUserInfoEntity = talentUserService.findById(id);
            toolUtil.wrapperTanlentUserInfo(talentUserInfoEntity);
            model.addAttribute("talentUser", talentUserInfoEntity);
        } else {
            Page<TalentUserInfoEntity> talentUserInfoEntities = talentUserService.getAll(0, 1);
            TalentUserInfoEntity talentUserInfoEntity = talentUserInfoEntities.getContent().get(0);
            toolUtil.wrapperTanlentUserInfo(talentUserInfoEntity);
            model.addAttribute("talentUser", talentUserInfoEntity);
            session.setAttribute(SessionKey.saveProfileField, talentUserInfoEntity.getId());
        }
        return "page/profile";
    }

    @GetMapping("/calculate")
    public String talentInfo(Model model, HttpSession session) {
        calculateController.getCandidate(session, model);
        calculateController.getLastCandidate(session, model);
        return "page/settlement";
    }

    @GetMapping("/calculatea")
    @ResponseBody
    public com.lida.dy.utils.Page talentInfso(Model model, HttpSession session) {
        Set<Integer> lastIds = (Set<Integer>) session.getAttribute(SessionKey.lastCandidateSetField);
        if (lastIds != null) {
            List<TalentUserInfoEntity> talentUserInfoEntities = talentUserService.searchByListId(lastIds);
            toolUtil.wrapperTanlentUserInfo(talentUserInfoEntities);
            com.lida.dy.utils.Page page = new com.lida.dy.utils.Page();
            page.setDataList(talentUserInfoEntities);
            page.setTotalElement(talentUserInfoEntities.size());
            return page;
        }
        return new com.lida.dy.utils.Page();
    }

    @GetMapping("/calculateb")
    @ResponseBody
    public com.lida.dy.utils.Page talentInfssdo(Model model, HttpSession session) {
        Set<Integer> ids = (Set<Integer>) session.getAttribute(SessionKey.candidateSetField);
        if (ids != null) {
            List<TalentUserInfoEntity> talentUserInfoEntities = talentUserService.searchByListId(ids);
            toolUtil.wrapperTanlentUserInfo(talentUserInfoEntities);
            com.lida.dy.utils.Page page = new com.lida.dy.utils.Page();
            page.setDataList(talentUserInfoEntities);
            page.setTotalElement(talentUserInfoEntities.size());
            return page;
        } else {
            return new com.lida.dy.utils.Page();
        }
    }

    @GetMapping("/getOverlapAvatarLink")
    @ResponseBody
    public Result getOverlapAvatarLink(HttpSession session) {
        Set<Integer> chongid = (Set<Integer>) session.getAttribute(SessionKey.chonghe);
        if (chongid != null) {
            ArrayList<String> link = new ArrayList<>();
            for (Integer id : chongid) {
                TalentUserInfoEntity ta = talentUserService.findById(id);
                link.add(ta.getAvatarLink());
            }
            if (!link.isEmpty()) {
                return Result.success(link);
            }
        }
        return Result.fail();
    }
}
