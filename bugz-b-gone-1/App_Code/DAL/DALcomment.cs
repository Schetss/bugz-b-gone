using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALcomment
/// </summary>
public class DALcomment
{
    private BugzDataContext dc = new BugzDataContext();

    // insert comment in database

    public void insertComment(Reaction1 p_comment)
    {
        dc.Reaction1s.InsertOnSubmit(p_comment);
        dc.SubmitChanges();
    }


}