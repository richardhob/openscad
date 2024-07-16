
module Scad.Mount where

import Graphics.OpenSCAD

sensor_hole :: Double -> Double -> Model3d
sensor_hole radius height = translate v (cylinder height radius (fn 50))
    where v = (0, 0, height/2) :: Vector3d

sensor :: Double -> Double -> Double -> Model3d
sensor radius thickness height = difference cyl hole
    where hole = sensor_hole radius height 
          cyl = cylinder height (radius + thickness) (fn 50)

fan_mount :: Double -> Double -> Double -> Double -> Double -> Model3d
fan_mount width radius distance thickness height = difference block screw_holes
    where block = box width thickness height
          screw = cylinder height radius (fn 10)
          screw1 = translate ((-height/2), distance, (-thickness*1.5)) screw
          screw2 = translate ((-height/2), (width-distance), (-thickness*1.5)) screw
          screw_holes = rotate (0, 90, -90) (union [screw1, screw2])

bridge :: Double -> Double -> Double -> Model3d
bridge radius thickness height = translate v $ difference block hole
    where block = box (radius+thickness) (radius+thickness) height
          hole = sensor_hole radius height
          v = (-(radius+thickness), -radius, 0)

mount :: Model3d
mount = union [(fan_mount fan_width radius screw_distance thickness height)
              ,(sensor radius thickness height)
              ,(bridge screw_radius thickness height)
              ]
    where radius = 18 / 2 -- mm
          fan_width = 40 -- mm
          screw_radius = 3 / 2 -- mm
          screw_distance = 4 -- mm
          thickness = 4 -- mm
          height = 6 -- mm
