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


    public List<UsersOnProject> getAllOnProject(UsersOnProject p_user)
    { 
       
        // HEAVY QUERY

        var query4 = from t in dc.Bugs
                     join s in dc.Projects
                     on t.fk_project equals s.pk_project_id
                     join u in dc.UsersOnProjects
                     on s.pk_project_id equals u.fk_project
                     join v in dc.ProductUsers
                     on u.fk_user equals v.pk_productuser_id
                     where v.pk_productuser_id == p_user.fk_user
                     select new
                     {
                         t.fk_bugstatus,
                         t.fk_creator,
                         t.pk_bug_id,
                         t.title,
                         t.description,
                         t.date,
                         t.fk_priority,
                         t.fk_project,
                         t.fk_responsible,
                         t.openclosed
                     };

       // List<Bug> x = query4.ToList();

        var query1 = from t in dc.UsersOnProjects
                     where t.fk_user == p_user.fk_user
                     select t;

       List<UsersOnProject> x = query1.ToList();

       return x;

       





   }

}