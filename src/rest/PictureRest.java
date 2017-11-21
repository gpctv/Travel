package rest;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

public class PictureRest extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private  List<String>  fileDisplay;
    private List<String> fileName;
    private String isRefresh;
    
    //給CLIENT 圖片陣列(檔名)
    @JSON(name="fileName")
	public List<String> getFileName(){
		return this.fileName;
	}
    //驗面是否需REFRESH(SERVER端圖片減少需REFRESH)
    @JSON(name="refresh") 
    public String getIsRefresh(){
    	return this.isRefresh;
    }
    //CLIENT端的圖片陣列
    public void setFileDisplay( List<String>  fileDisplay){
    this.fileDisplay=fileDisplay;	
    }
    
    @Override
    public String execute() throws Exception {
    	// TODO Auto-generated method stub
    	if(this.fileDisplay.isEmpty()){//如果CLIENT 沒圖片就給圖片
    		setFileName();
    	}else{
    		setFileNameList();
    	}
    	
    	return super.execute();
    }
    //給CLIENT 端目前SERVER端所有圖片
    private void setFileName(){
    	File[] files=getFileList();
        List<String> a=new ArrayList<String>();
    	for(File file:files){
    		a.add(file.getName());
    	} 
    	    this.fileName=a; 
     
    }
    //給CLENTE 端目前沒有的圖片 SERVER端有 CLIENT沒有
    private void setFileNameList(){
    	File[] files=getFileList();
    	List<String> a=new ArrayList<String>();
    	
    	for(File file:files){
    		if(!this.fileDisplay.contains(file.getName())){
    			a.add(file.getName());
    		}
    	}
    	this.fileName=a;
    	//SERVER端圖片有減少 重新整理
    	if(files.length < this.fileDisplay.size()){
    		this.isRefresh="true";
    	}
    }
    
    private File[] getFileList(){
    	String root=ServletActionContext.getServletContext().getRealPath("/");
    	root=root+"resource\\picture\\";
        File dir=new File(root);
        File[] files=dir.listFiles(new FilenameFilter() {
			
			public boolean accept(File dir, String name) {
				// TODO Auto-generated method stub
				return name.toLowerCase().endsWith(".jpg");
			}
		});
        return files;
    }
}
