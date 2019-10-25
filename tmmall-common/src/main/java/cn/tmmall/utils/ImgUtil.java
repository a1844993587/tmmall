package cn.tmmall.utils;

import org.springframework.web.multipart.MultipartFile;

public class ImgUtil {
    public static Boolean TypeofImg(MultipartFile file){
        String[] imgtype = new String[]{".jpg",".png"};
        if (file.isEmpty()){
            return false;
        }else {
            /*获取文件名*/
            String originalFileName = file.getOriginalFilename();
            /*获得图片后缀*/
            String lastName = originalFileName.substring(originalFileName.lastIndexOf("."));
            for(int i=0;i<imgtype.length;i++){
                if (imgtype[i].equals(lastName)){
                    return true;
                }
            }
        }
        return false;
    }
}
