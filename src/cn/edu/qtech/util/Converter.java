package cn.edu.qtech.util;
import java.util.HashMap;
import java.util.Map;

public class Converter {

	public static Map<String, String> convertMap(Map<String,String[]> map){
		Map<String, String> m=new HashMap<String, String>();
		if(map!=null){
			for(Map.Entry<String, String[]> entry:map.entrySet()){
//				获取对应的key
				String key=entry.getKey();
//				获取value
				String[] values=entry.getValue();
				if(values!=null){
					String value="";
					for(String v:values){
						value+=","+v;
					}
//					重新组装 为 新的Map
					m.put(key, value.substring(1));
				}
			}
		}
		return m;
	}

}
