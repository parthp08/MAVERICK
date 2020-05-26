function theta = angle_between_two_vec(vec1,vec2)
cos_theta = dot(vec1,vec2)/(norm(vec1)*norm(vec2));
theta = acos(cos_theta); % in rad
end

