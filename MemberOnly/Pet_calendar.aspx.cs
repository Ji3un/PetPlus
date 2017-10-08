using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.IO;

public partial class MemberOnly_Pet_calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["day"] != null)
            {
                Calendar1.SelectedDate = (DateTime)Session["day"];
                Calendar1.VisibleDate = (DateTime)Session["month"];
            }
            else
            {
                Calendar1.SelectedDate = Calendar1.TodaysDate;
            }

            //드롭다운 리스트 아이템 표시

            DropDownList1.Items.Add("anytime");
            for (int i = 0; i < 24; i++)
                DropDownList1.Items.Add(string.Format("{0:D2} 시", i));

            for (int i = 0; i < 6; i++)
                DropDownList2.Items.Add(string.Format("{0:D2} 분", i * 10));

            ShowToDoList(); //선택된 날짜의 스케줄을 오른쪽 datalist 에 표현함
        }
    }

    private void ShowToDoList()
    {
        string id = User.Identity.Name;
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"select * from diary where userID = @id and sDate = @sDate order by sTime";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@id", Page.User.Identity.Name);
        cmd.Parameters.AddWithValue("@sDate", Calendar1.SelectedDate.ToShortDateString());

        con.Open();
        DataList1.DataSource = cmd.ExecuteReader();
        DataList1.DataBind();
        con.Close();
    }

    protected string DoneCheck(object toDo, object hasDone) //DataList의 label3에 표시되기 위해 호출
    {
        string result = toDo.ToString();
        string done = hasDone.ToString();
        if (done == "Y")
        {
            result = "<strike>" + result + "</strike>";
        }
        return result;
    }

    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"delete diary where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", e.CommandArgument); //itemTemplate 에서 지정했음

        //실행
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ShowToDoList();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Done") //버튼에 지정한 commandName 별로 코드 작성하면 됨
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = @"update diary set hasDone='Y' where seq = @seq";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@seq", e.CommandArgument); //itemTemplate 에서 지정했음

            //실행
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ShowToDoList();
        }

        else if (e.CommandName == "Cancel") //할일 체크한거 취소시키는거
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = @"update diary set hasDone='N' where seq = @seq";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@seq", e.CommandArgument); //itemTemplate 에서 지정했음

            //실행
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ShowToDoList();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
        {
            Label25.Text = "로그인하셔야 등록됩니다.";
            return;
        } //임시로 주석처리(로그인 기능이 구현되면 실행시킬것)


        string sTime = DropDownList1.SelectedItem.Text + "" + DropDownList2.SelectedItem.Text;
        if (DropDownList1.SelectedIndex == 0)
            sTime = "anytime";

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"insert into diary(userID,sDate,sTime,toDo) values (@id, @sDate, @sTime,@toDo)";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@id", Page.User.Identity.Name);
        cmd.Parameters.AddWithValue("@sDate", Calendar1.SelectedDate.ToShortDateString());
        cmd.Parameters.AddWithValue("@sTime", sTime);
        cmd.Parameters.AddWithValue("@toDo", TextBox1.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ShowToDoList(); //오른쪽 리스트 새로 고침
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        string id = Page.User.Identity.Name;

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from diary where userID=@id and sDate=@sDate";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@id", Page.User.Identity.Name);
        cmd.Parameters.AddWithValue("@sDate", e.Day.Date.ToShortDateString()); //렌더링되는 각 날짜

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            e.Cell.Font.Bold = true; //일정이 있는 날짜만 강조하기 위해 각자 알맞은 서식 지정하기
            e.Cell.Font.Italic = true;
            e.Cell.ForeColor = System.Drawing.Color.Blue;
        }
        rd.Close();
        con.Close();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Session["day"] = Calendar1.SelectedDate;
        Session["month"] = Calendar1.VisibleDate;
        Label1.Text = Calendar1.SelectedDate.ToShortDateString();

        ShowToDoList();
    }
    protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        //다른 달로 이동할 때 발생
        Session["month"] = Calendar1.VisibleDate;
    }
}