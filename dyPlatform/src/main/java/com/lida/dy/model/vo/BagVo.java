package com.lida.dy.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lida.dy.model.entity.TalentUserInfoEntity;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @Auther: lida
 * @Description:
 * @Date 2020/2/5 0005 19:41
 * @Version: 1.0
 */
@Data
@ToString
public class BagVo {
    // [id,price,（value:播放量/粉丝数）,isSelect,realfans,播放量]
    public float[][] user;
    public int limitMony;
    public int limitNum;
    public String videoLength;
    public String ids;
    public String type;
    public float resultValue;    //最终价值
    public int realFans;
    public BagVo otherOptimization;
    public List<Integer> resultIds;
    public int talentNum;
    public int totalPrice;
    public int totalPlayNum;
    public float optimizationRate;  //更好的money 比例
}

