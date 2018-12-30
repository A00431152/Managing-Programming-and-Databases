var auto_id = 0;
var ptr = db.ARTICLE.find();
var ptr1= db.AUTHOR.find();

while (ptr.hasNext()){

    var doc = ptr.next();
       
        if(Array.isArray(doc.author))
        {
         for (var i=0;i<doc.author.length;i++)
               authors[i]=doc.author[i].ftext;
                 while (ptr1.hasNext())
               {

                 var doc1=ptr1.next();
                 str author =doc1.fname +""+doc1.lname;
                 if (str == authors[i])
                {
                     var row = {"art_auth_id":auto_id,"author_id":doc1._id, "article_id": doc.article_id};
                 db.ARTICLE_AUTHOR.insert(row);
                 auto_id++;
               }
         }
         else
            authors[0]=doc.author.ftext; 
             while (ptr1.hasNext())
               {

                 var doc1=ptr1.next();
                 str author =doc1.fname +""+doc1.lname;
                 if (str == authors[0])
                     var row = {"art_auth_id":auto_id,"author_id":doc1._id, "article_id": doc.article_id};
                 db.ARTICLE_AUTHOR.insert(row);
                 auto_id++;
               }

}
    /* var authors= new Array();   
         
        // for(i in doc.author)
        // authors.push(doc.author[i].ftext)
        
         if(Array.isArray(doc.author))
        {
         for (var i=0;i<doc.author.length;i++)
               authors[i]=doc.author[i].ftext;
         }
         else
            authors[0]=doc.author.ftext;
  
        var row = {"article_id":auto_id,"article_title":doc.title.ftext,"name":doc.journal.ftext, "vol_id":doc.volume.ftext,
           "year":doc.year.ftext, "page_num":doc.pages.ftext,"authors":authors};
        db.ARTICLE.insert(row);
        auto_id++;
    */



