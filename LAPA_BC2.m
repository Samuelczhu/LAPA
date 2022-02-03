% This file implement the code for ELEC 4700 PA 4
% The boundary conditions are: 1 on the left/right and 0 on top/bottom

% Clear all
clearvars
clearvars -global
close all
format shorte

% Define the size of the solution matrix
nx = 20;
ny = 20;
% Assume delta x = delta y = delta
delta = 1;

% Create the solution matrix
V = zeros(nx, ny);

% Create the mesh grid
[X, Y] = meshgrid([1:nx], [1:ny]);

% Set the maximum number of simulation iterations
numSim = 300; 
% Pause time per simulation iteration
pauseTime = 0.01;

% Loop through the simulation iterations
for iSim = 1:numSim
    % Loop through the solution matrix
    for ix = 1:nx  % Loop through the x
        for iy = 1:ny  % Loop through the y
            % Check for boundary conditions
            if ix==1
                V(ix,iy) = 1;  % Set BC to 1 on the left side
            elseif ix==nx
                V(ix,iy) = 1;  % Set BC to 1 on the right side
            elseif iy == 1  % Set BC to 0 on the bottom side
                V(ix, iy) = 0;
            elseif iy == ny  % Set BC to 0 on the top side
                V(ix, iy) = 0;
            else
                V(ix, iy) = (V(ix+1,iy) + V(ix-1,iy) + V(ix,iy+1) + V(ix,iy-1))/4;
            end
        end
    end
    % imboxfilt(V,3);
    
    % Plot the voltage surface
    surf(X,Y,V);

    % pause
    pause(pauseTime);
end

% Create the matrix for electric field
[Ex, Ey] = gradient(-V);

% Plot the electric field
figure(2)
quiver(X, Y, Ex, Ey);




