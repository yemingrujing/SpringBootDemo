package com.example.util.video;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * FFMPEG 的相关操作
 *
 * @author Wei.Guang
 * @create 2018-09-06 13:52
 **/
@Slf4j
public class FFMpegUtil {

    /**
     * ffmpeg的路径
     */
    private static String ffmpegEXE = "E:\\file\\ffmpeg\\bin\\ffmpeg.exe";

    public static final String ROOT_PATH = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("").replace("\\", File.separator);

    public static final String UPLOAD_ROOT_PATH = "upload";

    public static final String UPLOAD_VIDEO_PATH = "videos";

    public static String getUploadPath(String path) {
        return ROOT_PATH + File.separator + UPLOAD_ROOT_PATH + path;
    }

    public static String getUploadRootPath() {
        return getUploadPath("");
    }

    public static String getUploadVideoPath() {
        return getUploadPath(File.separator + UPLOAD_VIDEO_PATH);
    }

    public static File mkDir(String path) {
        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return dir;
    }

    /**
     * 生成下载根目录
     * @return
     */
    public static File mkUploadRootDir() {
        return mkDir(getUploadRootPath());
    }

    /**
     * 返回原文件的后缀
     * @param originalFileName
     * @return
     */
    public static String getOriginalFileSuffix(String originalFileName) {
        int index = originalFileName.lastIndexOf(".");
        if (index != -1) {
            return originalFileName.substring(index);
        } else {
            return originalFileName;
        }
    }

    /**
     *
     * @param path upload的子目录路径
     * @param originalFileName
     * @return
     */
    public static File createServerFile(String path, String originalFileName) {
        File dir = mkDir(getUploadPath(path));

        String originalFileNameSuffix = getOriginalFileSuffix(originalFileName);

        File serverFile = new File(dir.getAbsolutePath() + File.separator + System.currentTimeMillis() + originalFileNameSuffix);

        return serverFile;
    }

    /**
     * 返回从upload目录下面的相对路径
     * @param file
     * @return
     */
    public static String getRelativePathFromUploadDir(File file) {
        if (null == file) {
            return "";
        }
        String absolutePath = file.getAbsolutePath();
        if (absolutePath.indexOf(ROOT_PATH ) != -1 && ROOT_PATH.length() < absolutePath.length()) {
            return absolutePath.substring(absolutePath.indexOf(ROOT_PATH) + ROOT_PATH.length());
        } else {
            return "";
        }
    }

    /**
     * 单个文件转换成MP4
     * @param file
     * @return
     */
    public static String uploadSingleVideoFile(MultipartFile file) {
        String path = File.separator + UPLOAD_VIDEO_PATH;
        if (!file.isEmpty()) {
            try {
                File serverFile = createServerFile(path, file.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                int length = 0;
                byte[] buffer = new byte[1024];
                InputStream inputStream = file.getInputStream();
                while ((length = inputStream.read(buffer)) != -1) {
                    stream.write(buffer, 0, length);
                }
                stream.flush();;
                stream.close();

                log.info("Server File Location = " + serverFile.getAbsolutePath());
                System.out.println("文件上床完成，并开始转换：" + serverFile.getAbsolutePath());

                String ffmpegPath = ROOT_PATH + "\\scripts\\ffmpeg\\ffmpeg.exe";

                int dot = serverFile.getAbsolutePath().lastIndexOf(".");
                if ((dot > -1) && (dot < (serverFile.getAbsolutePath().length()))) {
                    String codcFilePath = serverFile.getAbsolutePath().substring(0, dot) + "_changed.mp4";
                    ExecuteCodecs executeCodecs = new ExecuteCodecs();
                    executeCodecs.exchangeToMp4(ffmpegPath, serverFile.getAbsolutePath(), codcFilePath);
                    File newFile = new File(codcFilePath);
                    return getRelativePathFromUploadDir(newFile).replace("\\\\", "/");
                } else {
                    return null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("文件内容为空");
        }
        return null;
    }

    /**
     * @param videoInputPath 视频的输入路径
     * @param videoOutPath   视频的输出路径
     * @throws Exception
     */
    // 拷贝视频，并指定新的视频的名字以及格式
    // ffmpeg.exe -i old.mp4 new.avi
    public static void convetor(String videoInputPath, String videoOutPath) throws Exception {

        List<String> command = new ArrayList<String>();
        command.add(ffmpegEXE);
        command.add("-i");
        command.add(videoInputPath);
        command.add(videoOutPath);
        ProcessBuilder builder = new ProcessBuilder(command);
        Process process = null;
        try {
            process = builder.start();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 使用这种方式会在瞬间大量消耗CPU和内存等系统资源，所以这里我们需要对流进行处理
        InputStream errorStream = process.getErrorStream();
        InputStreamReader inputStreamReader = new InputStreamReader(errorStream);
        BufferedReader br = new BufferedReader(inputStreamReader);

        String line = "";
        while ((line = br.readLine()) != null) {
        }
        if (br != null) {
            br.close();
        }
        if (inputStreamReader != null) {
            inputStreamReader.close();
        }
        if (errorStream != null) {
            errorStream.close();
        }

    }

    /**
     * @param videoInputPath 原视频的路径
     * @param audioInputPath 音频的路径
     * @param videoOutPath   视频与音频结合之后的视频的路径
     * @param time           视频的长度 ,单位为 s
     * @throws Exception
     */
    // 将视频和音频结合，并指定视频的长度，同时生成结合之后的视频文件
    // ffmpeg.exe -i tsd.mp4 -i "周笔畅+-+最美的期待.mp3" -t 7 -y new.avi
    public static void convetor(String videoInputPath, String audioInputPath, String videoOutPath, double time) throws Exception {

        List<String> command = new ArrayList<String>();
        command.add(ffmpegEXE);
        command.add("-i");
        command.add(videoInputPath);
        command.add("-i");
        command.add(audioInputPath);
        command.add("-t");
        command.add(String.valueOf(time));
        command.add("-y");
        command.add(videoOutPath);
        ProcessBuilder builder = new ProcessBuilder(command);
        Process process = null;
        try {
            process = builder.start();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 使用这种方式会在瞬间大量消耗CPU和内存等系统资源，所以这里我们需要对流进行处理
        InputStream errorStream = process.getErrorStream();
        InputStreamReader inputStreamReader = new InputStreamReader(errorStream);
        BufferedReader br = new BufferedReader(inputStreamReader);

        String line = "";
        while ((line = br.readLine()) != null) {
        }
        if (br != null) {
            br.close();
        }
        if (inputStreamReader != null) {
            inputStreamReader.close();
        }
        if (errorStream != null) {
            errorStream.close();
        }

    }

    /**
     * @param time_coverimg   视频的第几秒作为封面图
     * @param videoInputPath  视频的路径
     * @param frame           帧数
     * @param coverOutputPath 视频的封面图的路径
     * @throws Exception
     */
    // ffmpeg.exe -ss 00:00:01 -y -i 视频.mp4 -vframes 1 new.jpg
    public static void convetor(String time_coverimg, String videoInputPath, int frame, String coverOutputPath) throws Exception {

        List<String> command = new ArrayList<String>();
        command.add(ffmpegEXE);
        command.add("-ss");
        command.add(time_coverimg);
        command.add("-y");
        command.add("-i");
        command.add(videoInputPath);
        command.add("-vframes");
        command.add(String.valueOf(frame));
        command.add(coverOutputPath);
        ProcessBuilder builder = new ProcessBuilder(command);
        Process process = null;
        try {
            process = builder.start();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 使用这种方式会在瞬间大量消耗CPU和内存等系统资源，所以这里我们需要对流进行处理
        InputStream errorStream = process.getErrorStream();
        InputStreamReader inputStreamReader = new InputStreamReader(errorStream);
        BufferedReader br = new BufferedReader(inputStreamReader);

        String line = "";
        while ((line = br.readLine()) != null) {
        }
        if (br != null) {
            br.close();
        }
        if (inputStreamReader != null) {
            inputStreamReader.close();
        }
        if (errorStream != null) {
            errorStream.close();
        }
    }

    /**
     * 将file转换成MultipartFile
     * @param picPath
     * @return
     */
    public static MultipartFile getMulFileByPath(String picPath) {
        FileItem fileItem = createFileItem(picPath);
        MultipartFile mfile = new CommonsMultipartFile(fileItem);
        return mfile;
    }

    private static FileItem createFileItem(String filePath)
    {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        String textFieldName = "textField";
        int num = filePath.lastIndexOf(".");
        String extFile = filePath.substring(num);
        FileItem item = factory.createItem(textFieldName, "text/plain", true,
                "MyFileName" + extFile);
        File newfile = new File(filePath);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        try
        {
            FileInputStream fis = new FileInputStream(newfile);
            OutputStream os = item.getOutputStream();
            while ((bytesRead = fis.read(buffer, 0, 8192))
                    != -1)
            {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            fis.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return item;
    }

//    public static void main(String[] args){
//        MultipartFile file = getMulFileByPath("");
//    }
}
