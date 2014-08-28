using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALmyproject
/// </summary>
public class DALmyproject
{
    BugzDataContext dc = new BugzDataContext();

    // get all projects where the user is on

    public List<UsersOnProject> getAllKeys(UsersOnProject p_user)
    {
        var query = from t in dc.UsersOnProjects
                    where t.fk_user == p_user.fk_user
                    select t;

        List<UsersOnProject> x = query.ToList();

        return x;

    }





}