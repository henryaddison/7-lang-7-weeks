(ns week6-clojure.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn big 
  "From Week 6 Day 1 exercises: returns true if a string st is longer than n characters"
  [st n]
  (> (count st) n)
)

(defn collection-type
  "From Week 6 Day 1 exercises: returns :list, :map, or :vector based on the type of collection col"
  [col]
  (def types {clojure.lang.PersistentList :list, clojure.lang.PersistentList$EmptyList :list, clojure.lang.PersistentArrayMap :map, clojure.lang.PersistentVector :vector})
  (types (class col))
)
