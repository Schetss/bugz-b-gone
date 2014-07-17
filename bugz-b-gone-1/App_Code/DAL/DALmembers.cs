using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALmembers
/// </summary>
public class DALmembers
{
    BugzDataContext dc = new BugzDataContext();

    public void insertMember(ProductUser p_productuser)
    {
        dc.ProductUsers.InsertOnSubmit(p_productuser);
        dc.SubmitChanges();

    }

    public void insertUserProject(UsersOnProject p_UserProject)
    {
        dc.UsersOnProjects.InsertOnSubmit(p_UserProject);
        dc.SubmitChanges();
    }

}