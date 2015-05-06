

import scala.io._
import scala.actors._
import Actor._

// START:loader
object PageLoader {
 def getPageSize(url : String) = Source.fromURL(url).mkString.length

 def getPageLinkCount(url : String) = "<a ".r.findAllIn(Source.fromURL(url).mkString).size
}
// END:loader

val urls = List("http://www.amazon.com/", 
               "http://www.twitter.com/",
               "http://www.google.com/",
               "http://www.cnn.com/" )

// START:time
def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
 for(url <- urls) {
   println("Size for " + url + ": " + PageLoader.getPageSize(url) + " with " + PageLoader.getPageLinkCount(url) + " links")
 }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor { caller ! (url, PageLoader.getPageSize(url), PageLoader.getPageLinkCount(url)) }
 }

 for(i <- 1 to urls.size) {
   receive {
     case (url, size, link_count) =>
       println("Size for " + url + ": " + size + " with " + link_count + " links")
   }
 }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
// END:script