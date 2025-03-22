package hkmu.comps380f.onlinebookstore.utils;

import jakarta.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class RequestUtil {


    public static Object getRequestConvertBean(HttpServletRequest request, Class<?> beanClass) {
        Object obj = null;
        try {
            //reflection
            obj = beanClass.newInstance();
            // Get entity class fields
            Field[] fields = beanClass.getDeclaredFields();
            Class<?> fieldType; // Field declaration type
            String fieldName; // Field Name
            for (Field field : fields) {
                // Set this field to private to make it accessible
                field.setAccessible(true);
                fieldName = field.getName();
                // final in judgment entity
                if (Modifier.isFinal(field.getModifiers())) {
                    continue;
                }
                // Skip this field if empty
                if (request.getParameter(fieldName) == null || request.getParameter(fieldName).isEmpty()) {
                    field.set(obj, null);
                    continue;
                }
                // Field type declaration
                fieldType = field.getType();
                // Field type conversion
                if (fieldType == int.class || fieldType == Integer.class) {
                    field.set(obj, Integer.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == long.class || fieldType == Long.class) {
                    field.set(obj, Long.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == float.class || fieldType == Float.class) {
                    field.set(obj, Float.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == double.class || fieldType == Double.class) {
                    field.set(obj, Double.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == boolean.class || fieldType == Boolean.class) {
                    field.set(obj, Boolean.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == short.class || fieldType == Short.class) {
                    field.set(obj, Short.valueOf(request.getParameter(fieldName)));
                } else if (fieldType == BigDecimal.class) {
                    field.set(obj, BigDecimal.valueOf(Long.parseLong(request.getParameter(fieldName))));
                } else if (fieldType == Date.class) {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    field.set(obj, formatter.parse(request.getParameter(fieldName)));
                } else if (fieldType == String.class) {
                    field.set(obj, request.getParameter(fieldName));
                } else {
                    System.out.println("Unknown field type");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }

}
