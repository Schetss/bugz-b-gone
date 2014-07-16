using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLprojects
/// </summary>
public class BLLprojects
{
    DALprojects DALprojects = new DALprojects();

    public void insertProject(Project p_project)
    {
        DALprojects.insertProject(p_project);
    }
}