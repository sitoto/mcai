if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini|UCWEB|MQQBrowser/i.test(navigator.userAgent) ) {
  document.writeln("<script type=\"text/javascript\">");
  document.writeln("var cpro_id = \"u1518435\";");
  document.writeln("</script>");
  document.writeln("<script src=\"http://cpro.baidustatic.com/cpro/ui/cm.js\" type=\"text/javascript\"></script>");
}
else {
  document.writeln("<script type=\"text/javascript\">");
  document.writeln("var cpro_id = \"u1541387\";");
  document.writeln("</script>");
  document.writeln("<script src=\"http://cpro.baidustatic.com/cpro/ui/c.js\" type=\"text/javascript\"></script>");
}
