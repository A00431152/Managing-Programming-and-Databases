var auto_id = 0;
var ptr = db.TEMPARTICLE.find();

while (ptr.hasNext()){
    var doc = ptr.next();
     var authors= new Array();   
         
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
    
}


