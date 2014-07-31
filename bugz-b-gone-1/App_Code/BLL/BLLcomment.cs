using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLcomment
/// </summary>
public class BLLcomment
{

    DALcomment DALcomment = new DALcomment();

    public void insertComment(Reaction1 p_comment)
    {
        DALcomment.insertComment(p_comment);
    }
}