lazy val commonSettings = Seq(
  organization := "com.github.spacewander",
  version := "0.1.0",
  scalaVersion := "2.11.6"
)

lazy val root = (project in file(".")).
  settings(commonSettings: _*).
  settings(
    name := "AlgorithmAndDataStructure",
    libraryDependencies ++= Seq(
    "org.scalatest" %% "scalatest" % "2.1.7" % "test"
    )
)
