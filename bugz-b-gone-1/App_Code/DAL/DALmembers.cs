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

        var query = from t in dc.UsersOnProjects
                    where t.fk_project == p_UserProject.fk_project
                    &&
                    t.fk_user == p_UserProject.fk_user
                    select t;

        List<UsersOnProject> x = query.ToList();

        if (x.Count > 0)
        {
            throw new Exception("User is already on project");
        }
        else
        {
            dc.UsersOnProjects.InsertOnSubmit(p_UserProject);
            dc.SubmitChanges();

        }
    }
}