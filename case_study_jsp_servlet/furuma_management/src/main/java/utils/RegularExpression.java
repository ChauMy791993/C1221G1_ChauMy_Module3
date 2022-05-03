package utils;

import java.util.regex.Pattern;

public class RegularExpression {
    private static final String NOT_VN_NAME = "^[A-Za-z ]{5,50}$";
    private static final String VN_NAME = "^\\p{L}+[0-9]*( (\\p{L}|[0-9])+)*$";

    private static final String POSITIVE_NUMBER = "[+]?\\d+";

    private static final String POSITIVE_TENS_NUMBER = "[+]?\\d*\\.?\\d*";

    private static final String CODE_CUSTOMER = "KH-\\d{4}";

    private static final String SERVICE_CODE = "DV-\\d{4}";

    private static final String PHONE_NUMBER = "((\\(84\\)\\+(90))|(\\(84\\)\\+(91))|(090)|(091))\\d{7}";

    private static final String ID_CARD = "\\d{9}|\\d{12}";

    private static final String EMAIL_VALIDATE = "([a-z]\\w+@[a-z]{2,}\\.)\\w{2,10}(\\.\\w{2,3})?";

    private final String DATE_VALIDATE = "^([012]\\d|[3][0-1])/([0]\\d|[1][0-2])/((19)(\\d){2}|(20)(([01]\\d)|[2][0-2]))$";

    public static boolean checkIdCard(String idCard) {
        return idCard.matches(ID_CARD);
    }

    public static boolean checkName(String name) {
        return name.matches(VN_NAME);
    }

    public static boolean checkPhone(String phone) {
        return phone.matches(PHONE_NUMBER);
    }

    public static boolean checkEmail(String email) {
        return email.matches(EMAIL_VALIDATE);
    }

    public static boolean checkSalary(String salary) {
        return salary.matches(POSITIVE_TENS_NUMBER);
    }

}
