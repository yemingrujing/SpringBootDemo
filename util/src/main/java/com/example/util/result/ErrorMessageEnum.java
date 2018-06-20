package com.example.util.result;

/**
 * Created by liaoxiaoli on 2018/5/24.
 */
public enum ErrorMessageEnum {
    操作失败(-1, "操作失败"),
    操作成功(0, "操作成功"),
    图片大小不能超过2M(60001, "图片大小不能超过2M"),
    上传图片解析异常(60002, "上传图片解析异常"),
    图片宽高不能超过规定大小(60003, "图片宽高不能超过规定大小"),
    上传图片格式不正确(60004, "图片格式只能是jpeg,gif,jpg,png,bmp"),
    分类名称不可为空(60005, "分类名称不可为空"),
    分类名称过长(60006, "分类名称过长"),
    分类记录不存在(60007, "分类记录不存在"),
    分类信息保存失败(60008, "分类信息保存失败"),
    分类状态码不可为空(60009, "分类状态码不可为空"),
    分类状态码错误(60010, "分类状态码错误"),
    分类等级不可为空(60011, "分类等级不可为空"),
    分类ID不可为空(60012, "分类ID不可为空"),
    操作类型不可为空(60013, "操作类型不可为空"),
    分类不存在(60014, "分类不存在"),
    分类不可为空(60015, "分类不可为空"),
    标题为空(60016, "标题为空"),
    标题过长(60017, "标题过长"),
    文章摘要为空(60018, "文章摘要为空"),
    文章摘要过长(60019, "文章摘要过长"),
    保存文章信息失败(60020, "保存文章信息失败"),
    文章不存在(60021, "文章不存在"),
    文章ID不可为空(60022, "文章ID不可为空"),
    文章状态码不可为空(60023, "文章状态码不可为空"),
    文章状态码错误(60024, "文章状态码错误"),
    修改文章状态信息失败(60025, "修改文章状态信息失败"),
    文章删除状态码不可为空(60026, "文章删除状态码不可为空"),
    文章删除状态码错误(60027, "文章删除状态码错误"),
    文章查询错误(60028, "文章查询错误"),
    文章操作错误(60029, "文章操作错误"),
    已经点赞过(60030, "已经点赞过"),
    点赞状态码错误(60031, "点赞状态码错误"),
    参数不合法(60032, "参数不合法"),
    文章评论保存失败(60033, "文章评论保存失败"),
    文章评论不存在(60034, "文章评论不存在"),
    文章评论查询错误(60035, "文章评论查询错误"),
    文章评论ID不可为空(60036, "文章评论ID不可为空"),
    操作权限受限(60037, "操作权限受限"),
    轮播图参数列表为空(60038, "轮播图参数列表为空"),
    字典code为空(60039, "字典code为空"),
    字典名称为空(60040, "字典名称为空"),
    字典类型为空(60041, "字典类型为空"),
    字典类型名称为空(60042, "字典类型名称为空"),
    字典code过长(60043, "字典code过长"),
    字典类型过长(60043, "字典类型过长"),
    字典描述过长(60044, "字典描述过长"),
    字典类型已存在(60045, "字典类型已存在"),

    用户信息为空(10001, "用户信息为空"),
    您没有选择角色信息(10002, "您没有选择角色"),
    角色信息为空(10003, "角色信息为空"),
    您没有选择菜单(10004, "您没有选择菜单"),
    参数错误(99999, "错误");

    private String message;
    private int intValue;

    /**
     * 构造函数必须为private的,防止意外调用
     *
     * @param intValue
     * @param stringValue
     */
    ErrorMessageEnum(int intValue, String stringValue) {
        this.message = stringValue;
        this.intValue = intValue;
    }

    public String getMessage() {
        return message;
    }

    public int getIntValue() {
        return intValue;
    }

    public static ErrorMessageEnum getEnum(int intValue) {
        for (ErrorMessageEnum em : values()) {
            if (em.getIntValue() == intValue) {
                return em;
            }
        }
        return 参数错误;
    }

    public String getResult() {
        return "结果码：" + this.intValue + "，结果描述：" + this.message;
    }
}