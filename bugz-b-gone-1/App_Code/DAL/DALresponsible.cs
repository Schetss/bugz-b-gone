using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALresponsible
/// </summary>
public class DALresponsible
{

    BugzDataContext dc = new BugzDataContext();

    // get all users for that are on a project

    public List<UsersOnProject> getAllUsers(UsersOnProject p_project)
    {
        var query = from t in dc.UsersOnProjects
                    where t.fk_project == p_project.fk_project
                    select t;

        List<UsersOnProject> x = query.ToList();

        return x;
    }

}