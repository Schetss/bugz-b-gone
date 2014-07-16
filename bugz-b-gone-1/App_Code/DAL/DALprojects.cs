using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALprojects
/// </summary>
public class DALprojects
{

    private BugzDataContext dc = new BugzDataContext();

    // INSERT

    public void insertProject(Project p_project)
    {
        dc.Projects.InsertOnSubmit(p_project);
        dc.SubmitChanges();
    }

    public void changeToNonActive(Project p_projectstatus)
    {
       
    }


}