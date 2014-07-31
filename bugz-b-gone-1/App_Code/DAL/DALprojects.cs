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
        // Search the database value 
        var query = from t in dc.Projects
                    where t.pk_project_id == p_projectstatus.pk_project_id
                    select t;
        List<Project> x = query.ToList();

        // Execute query and change colomn values

        if (x.Count > 0)
        {
            foreach (Project project in query)
            {
                project.fk_projectstatus = 2;
            }
        }

        else
        {
            throw new Exception("Something went wrong with this project!");
        }

        // submit changes to database

        try
        {
            dc.SubmitChanges();
        }

        catch (Exception e)
        {
            Console.WriteLine(e);
        }

    }



    public void changeToActive(Project p_projectstatus)
    {
        // Search the database value 
        var query = from t in dc.Projects
                    where t.pk_project_id == p_projectstatus.pk_project_id
                    select t;
        List<Project> x = query.ToList();

        // Execute query and change colomn values

        if (x.Count > 0)
        {
            foreach (Project project in query)
            {
                project.fk_projectstatus = 1;
            }
        }

        else
        {
            throw new Exception("Something went wrong with this project!");
        }

        // submit changes to database

        try
        {
            dc.SubmitChanges();
        }

        catch (Exception e)
        {
            Console.WriteLine(e);
        }

    }


}