package com.axp.dao;import java.sql.Timestamp;import java.util.List;import com.axp.model.Captcha;public interface CaptchaDAO extends IBaseDao<Captcha> {    /**     * 检查是否有对应的电话号码和验证码与之对应；     *     * @param phoneNumber  电话号码；     * @param securityCode 验证码；     * @return     */    Boolean contaionCaptcha(String phoneNumber, String securityCode);}