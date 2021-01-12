# receive a string with arithmetic expressions
# only the four basic arithmetical operators (+, -, /, *), numbers and parenthesis
def cal_sol(str)
    par1=0
    par2=0
    array = str.split('')
    return str if array.none?(%r{[/*/+-/(/)]})
    while array.any?('(')
        i=1
        while i<array.length
            if array[i]=='(' || array[i]==')'
                par1=par2
                par2=i
            end
            if array[par1]=='(' && array[par2]==')'
                array = (par1!=0 ? array[0..par1-1] : []).concat([cal_sol(array[par1+1..par2-1].join(''))]).concat(array[par2+1..array.length])
                i=par1
                par2=par1-1
                par1=par1-1
            end
            i+=1
        end
    end
   new_string = array.join('')
   numbers= new_string.split(%r{[/*/+-]})
   signs= new_string.split(%r{[^/*/+-]}).join('').split('')
   elements = []
   (numbers.length+signs.length).times do |i|
       if i%2==0
           elements.push(numbers[0])
           numbers.delete_at(0)
       else 
           elements.push(signs[0])
           signs.delete_at(0)
       end
   end
   operations = ['/','*','-','+']
   operations.each do |ops|
    i=1
    while i<elements.length-1
        if elements[i]==ops
            new_value= [elements[i-1].to_f, elements[i+1].to_f].inject(ops.to_sym)
            puts new_value
            elements = (i>=2 ? elements[0..i-2] : []).concat([new_value]).concat(elements[i+2..elements.length])
            i-=1
        end
        i+=1
    end
   end
   elements[0].to_s
end
puts cal_sol('4+(8+(2*16))/5*2') # =20