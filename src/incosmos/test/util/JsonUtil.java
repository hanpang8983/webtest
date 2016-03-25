package incosmos.test.util;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * Created by InCosmos on 2016/3/9.
 */
public class JsonUtil {
    static public StringBuilder sb;

    static public String toJson(Object obj){
        sb=new StringBuilder();
        parseJson(obj);
        return sb.toString();
    }

    static public void parseJson(Object obj){
        if (obj instanceof Collection){
            //Collection集合处理方式
            sb.append("[");
            int i=0;
            Iterator ite=((Collection)obj).iterator();
            while (ite.hasNext()){
                if (i!=0){
                    sb.append(",");
                }
                getObjectField(ite.next());
                i++;
            }
            sb.append("]");
        }else if (obj instanceof Map) {
            //Map集合处理方式
            sb.append("[");
            Map map=((Map)obj);
            Iterator ite=map.keySet().iterator();
            int i=0;
            String key;
            while (ite.hasNext()){
                if (i!=0){
                    sb.append(",");
                }
                sb.append("{");
                key=ite.next().toString();
                sb.append("\""+key+"\":");
                parseJson(map.get(key));
                i++;
                sb.append("}");
            }
            sb.append("]");
        }else if(obj.getClass().isArray()){
            //数组处理方式
            sb.append("[");
            for (int i=0;i<Array.getLength(obj);i++){
                if (i!=0){
                    sb.append(",");
                }
                parseJson(Array.get(obj,i));
            }
            sb.append("]");
        }else if(obj instanceof Number){
            //数字处理方式
            sb.append(obj.toString());
        }else if(obj instanceof String ||obj instanceof Date|| obj instanceof Boolean){
            //字符串或时间处理方式
            sb.append("\""+obj.toString()+"\"");
        }else{
            //对象处理方式
            getObjectField(obj);
        }
    }

    //处理对象方法。主要是获取对象所有属性
    static private void getObjectField(Object obj){
        sb.append("{");
        Class clazz=obj.getClass();
        Field field[]=clazz.getDeclaredFields();
        for (int i=0; i<field.length;i++){
            if (i!=0){
                sb.append(",");
            }
            sb.append("\""+field[i].getName()+"\":");
            char[] cs=field[i].getName().toCharArray();
            cs[0]-=32;
            String methodName="get"+String.valueOf(cs);
            try {
                Method method=clazz.getDeclaredMethod(methodName);
                Object val= method.invoke(obj);
                parseJson(val);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        sb.append("}");
    }
}
