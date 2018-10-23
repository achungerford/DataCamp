# 
# 
# 
# 
# 
# 
# 
# Title: Loops
#
# Summary:
#   crtl-C terminates a while loop
#
#   while loops & break statements



# while loop

# set up your counter outside the loop
# while (condition){
#   expr
#   increment or decrement counter
# }


# example 1
ctr <- 1
while(ctr <= 5){
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}

# example 2
speed <- 64
while(speed >= 30){
  print(paste("Slow down!"))
  speed <- speed -7
}


# break statement example: terminate loop as soon as ctr is divisible by 5.
ctr <- 1
while(ctr <= 7){
  if(ctr %% 5 == 0){
    break
  }
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}












