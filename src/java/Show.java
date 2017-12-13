
import javax.servlet.jsp.tagext.TagSupport;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hakim
 */
public class Show extends TagSupport{
    private String sname;
    public int doStartTag()
    {
        try{
            pageContext.getOut().print("Your email is "+sname);
        }catch(Exception e){
        }
        return SKIP_BODY;
    }
    public int doEndTag()
    {
        return EVAL_PAGE;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
    
}
