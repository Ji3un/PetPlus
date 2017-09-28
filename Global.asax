<%@ Application Language="C#" %>
<%@ Import Namespace ="System.IO" %>

<script runat="server">

    int ReadCounter()
    {
        string path = Server.MapPath(@"~\App_Data\Counter.txt");
        FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
        StreamReader reader = new StreamReader(fs);
        string sCount = reader.ReadLine();
        reader.Close();
        fs.Close();

        return int.Parse(sCount);
    }

    void WriteCounter(object x)
    {
        string path = Server.MapPath(@"~\App_Data\Counter.txt");
        FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Write, FileShare.ReadWrite);
        StreamWriter writer = new StreamWriter(fs);
        writer.WriteLine(x.ToString());
        writer.Close();
        fs.Close();
    }

    void Application_Start(object sender, EventArgs e) 
    {
        // 응용 프로그램이 시작될 때 실행되는 코드입니다.
        Application["Counter"] = ReadCounter();
        Application["ActiveCounter"] = 0;


    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  응용 프로그램이 종료될 때 실행되는 코드입니다.

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 처리되지 않은 오류가 발생할 때 실행되는 코드입니다.

    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session.Timeout = 1; //분 테스트용
        Application.Lock();
        Application["Counter"] = (int)Application["Counter"] + 1;
        Application["ActiveCounter"] = (int)Application["ActiveCounter"] + 1;
        Application.UnLock();
        
        // 새 세션이 시작할 때 실행되는 코드입니다.
        if ((int)Application["Counter"] % 2 == 0)
            WriteCounter(Application["Counter"]);

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 세션이 끝날 때 실행되는 코드입니다. 
        // 참고: Session_End 이벤트는 Web.config 파일에서 sessionstate 모드가
        // InProc로 설정되어 있는 경우에만 발생합니다. 세션 모드가 StateServer 또는 SQLServer로 
        // 설정되어 있는 경우에는 이 이벤트가 발생하지 않습니다.

        Application.Lock();
        Application["ActiveCounter"] = (int)Application["ActiveCounter"] - 1;
        Application.UnLock();
    }
       
</script>
